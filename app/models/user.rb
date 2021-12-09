class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :collections
  has_many :invitations
  has_many :pending_invitations, -> { where confirmed: 'false' }, class_name: 'Invitation', foreign_key: "friend_id"
  has_one_attached :photo
  acts_as_favoritor

  def friends
    friends_i_sent_invitation = Invitation.where(user_id: id, confirmed: 'true').pluck(:friend_id)
    friends_i_got_invitation = Invitation.where(friend_id: id, confirmed: 'true').pluck(:user_id)
    ids = friends_i_sent_invitation + friends_i_got_invitation
    User.where(id: ids)
  end

  def friends_i_sent_invitation
    friends_i_sent_invitation = Invitation.where(user_id: id).pluck(:friend_id)
    Invitation.where(friend_id: friends_i_sent_invitation)
  end

  def friend_with?(user)
    Invitation.confirmed_record?(id, user.id)
  end

  # def pending_invitation(user)
  #   Invitation.pending_record?(id, user.id)
  # end

  def send_invitation(user)
    invitations.create(friend_id: user.id)
  end

end
