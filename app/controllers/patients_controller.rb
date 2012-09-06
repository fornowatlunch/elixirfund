class PatientsController < ApplicationController
  load_and_authorize_resource :user, :parent => false

  def index
    @patients = @users
  end

  def show
    @patient = @user
  end
end
