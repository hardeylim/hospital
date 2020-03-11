# frozen_string_literal: true

class Api::HeadNursesController < ApplicationController
  def index
    render json: HeadNurses::Builder.new.index
  end

  def create
    @head_nurse = HeadNurse.new({nurse_id: params[:id]})
    if @head_nurse.save
      render json: { nurse: @nurse }
    else
      render json: { errors: @head_nurse.errors.full_messages }, 422
    end
  end

  # Removes head_nurse_id from nurse table
  def delete
    if HeadNurse.find_by(id: params[:id])&.destroy
      render json: { nurse: @nurse }
    else
      render json: { errors: @service.errors }, status: 422
    end
  end
end
