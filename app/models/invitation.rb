class Invitation < ApplicationRecord
  belongs_to :user
  belongs_to :friend, class_name: 'User', foreign_key: "friend_id"
  validates :user_id, uniqueness: { scope: :friend, message: "You already sent an invitation to this user" }

  def reacted?(id1, id2)
    case1 = !Invitation.where(user_id: id1, friend_id: id2).empty?
    case2 = !Invitation.where(user_id: id2, friend_id: id1).empty?
    case1 || case2
  end

  def self.confirmed_record?(id1, id2)
    case1 = !Invitation.where(user_id: id1, friend_id: id2, confirmed: 'true').empty?
    case2 = !Invitation.where(user_id: id2, friend_id: id1, confirmed: 'true').empty?
    case1 || case2
  end

  def self.pending_record?(id1, id2)
    case1 = !Invitation.where(user_id: id1, friend_id: id2, confirmed: 'false').empty?
    case2 = !Invitation.where(user_id: id2, friend_id: id1, confirmed: 'false').empty?
    case1 || case2
  end

  def self.find_invitation(id1, id2)
    unless Invitation.where(user_id: id1, friend_id: id2).empty?
      Invitation.where(user_id: id1, friend_id: id2)[0].id
    end
  end

  def confirm
    update(confirmed: 'true')
  end

  def reject
    update(confirmed: 'declined')
  end
end
