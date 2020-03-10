# frozen_string_literal: true

class Api::HeadNursesController < ApplicationController
  def index
    render json: HeadNurses::Builder.new.index
  end

  def create
    if (@head_nurse = HeadNurse.create(params[:id]))
      render json: { nurse: @nurse }, success: true
    else
      render json: { errors: @service.errors }, status: 422
    end
  end

  # Removes head_nurse_id from nurse table
  def delete
    if HeadNurse.find_by(id: params[:id])&.destroy
      render json: { nurse: @nurse }, success: true
    else
      render json: { errors: @service.errors }, status: 422
    end
  end
end
