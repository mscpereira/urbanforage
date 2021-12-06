class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
  end

  def dashboard_my_friendlist
    @friends = current_user.friends
    @pending_sent_invitations = current_user.invitations.where(confirmed: 'false')
    @all_sent_invitations = current_user.friends_i_sent_invitation
    @pending_received_invitations = current_user.pending_invitations
    # @pending_invitations = current_user.pending_invitation
  end

end
