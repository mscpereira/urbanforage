class InvitationsController < ApplicationController

  def confirm
    @invitation = Invitation.find(params[:id])
    @invitation.confirm
    redirect_to dashboard_friendlist_path
  end

  def reject
    @invitation = Invitation.find(params[:id])
    @invitation.reject
    redirect_to dashboard_friendlist_path
  end

  private

  def set_invitation
    @invitation = Invitation.find(params[:id])
  end
end
