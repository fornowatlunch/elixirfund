class RegistrationsController < Devise::RegistrationsController
  before_filter :authenticate_scope!, :only => [:show]

  def show
  end

  def new
    if !params[:token].blank?
      session[:invite_token] = params[:token]
    end
    super
  end

  def create
    super
    if !session[:invite_token].blank?
      invitation = Invitation.find_by_token(session[:invite_token])
      if !resource.connected_to(User.find(invitation.invitor_id))
        resource.connections << (Connection.create! :user => resource, :to_user => invitation.invitor_id)
      end 
    end
  end
end
