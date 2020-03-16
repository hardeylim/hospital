# frozen_string_literal: true

class Api::NursesController < ApplicationController
  def index
    render json: Nurses::Builder.new.index
  end

  def show
    @nurse = Nurse.find(params[:id])

    render json: @nurse
  end

  def create
    @service = Nurses::Processor.new
    if (res = @service.create(nurse_params))
      render json: { nurse: res }
    else
      render json: { errors: @service.errors }, status: 422
    end
  end

  def edit; end

  def update; end

  def destroy; end

  # POST nurses/:id/assign
  # {
  #   patient_id: 1
  # }
  def assign
    @service = Nurses::Assigner.new
    @service.assign(params[:id], params[:patient_id])
    if @service.errors.length.zero?
      render json: { success: true }
    else
      render json: { errors: @service.errors }, status: 422
    end
  end

  private

  def nurse_params
    params.require(:nurse).permit(
      :name,
      :address
    )
  end
end