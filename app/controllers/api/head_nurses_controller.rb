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

  def delete
    render
  end
end
