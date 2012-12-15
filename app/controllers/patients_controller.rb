class PatientsController < ApplicationController
  load_and_authorize_resource

  def index
    @patients = @patients.page params[:page]
  end

  def show
  end

  def new
  end

  def create
    @patient.user = current_user
    @patient.avatar = params[:file]
    if @patient.save!
      redirect_to account_path, :notice => t('label.patient_created')
    else
      render :new
    end
  end

  def edit
    @patient = Patient.find(params[:id])
  end

  def update
    if @patient.update_attributes params[:patient]
      redirect_to patient_path(@patient), :notice => t('label.patient_updated')
    else
      render :edit
    end
  end
end
