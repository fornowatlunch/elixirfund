class InvitationsController < ApplicationController
  def new
    @invitation = Invitation.new
    if !params[:type].blank? && params[:type] == 'caregiver'
      render :new_caregiver
    else
      render :new
    end 
  end

  def create
    @invitation = Invitation.new(params[:invitation])
    @invitation.invitor_id = current_user.id
    if @invitation.save
      Invitations.invite(@invitation, current_user).deliver
      redirect_to account_path, notice: I18n.t('flash.create_invitation')
    else
      render :new
    end
  end
end
