class Api::PatientsController < ApplicationController

  def index
    @patients = Patient.all
    render json: @patients
  end

  def show
    @patient = Patient.find(params[:id])
    render json: @patient
  end

  def new

  end

  def create

  end

  def edit

  end

  def update

  end

  def destroy

  end

end