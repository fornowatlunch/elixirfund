class InvitationsController < ApplicationController
  def new
    @invitation = Invitation.new
  end

  def create
    @invitation = Invitation.new(params[:invitation])
    if @invitation.save
      Invitations.invite(@invitation, current_user).deliver
      redirect_to account_path, notice: I18n.t('flash.create_invitation')
    else
      render :new
    end
  end
end