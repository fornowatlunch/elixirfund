class PatientsController < ApplicationController
  load_and_authorize_resource

  def index
  end

  def show
  end

  def new
  end

  def create
    @patient.user = current_user
    if @patient.save!
      redirect_to account_path, :notice => t('label.patient_created')
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @patient.update_attribuptes params[:patient]
      redirect_to patient_path(@patient), :notice => t('label.patient_updated')
    else
      render :edit
    end
  end
end
