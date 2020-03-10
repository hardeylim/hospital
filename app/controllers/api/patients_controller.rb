# frozen_string_literal: true

class Api::PatientsController < ApplicationController
  def index
    @patients = Patient.all
    render json: @patients
  end

  def show
    @patient = Patient.find(params[:id])
    render json: @patient
  end

  def create
    @user = User.new(patient_params)
    @patient = Patient.create(user_id: @user.id) if @user.save

    render json: @patient
  end

  def edit; end

  def update; end

  def destroy; end

  private

  def patient_params
    params.require(:patient)
          .permit(
            :name
          )
  end
end
