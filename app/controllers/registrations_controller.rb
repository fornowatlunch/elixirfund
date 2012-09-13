class RegistrationsController < Devise::RegistrationsController
  before_filter :authenticate_scope!, :only => [:show]

  def show
  end
end
