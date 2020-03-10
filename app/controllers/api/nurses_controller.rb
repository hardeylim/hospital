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
    if (@user = User.create(nurse_params))
      @nurse = Nurse.create(user_id: @user.id)
    end

    render json: @nurse
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def assign
    @service = Nurses::Assigned.new.assign
  end

  private

  def nurse_params
    params.require(:nurse).permit(
        :name
    )
  end
end
