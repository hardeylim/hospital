# frozen_string_literal: true

class Api::NursesController < ApplicationController
  def index
    # @nurses = Nurse.all
    @nurses = []
    # includes prevent N+1
    Nurse.includes(:patients).order('id DESC').each do |nurse|
      @nurses.push({
                       id: nurse.id,
                       name: nurse.user.name,
                       patients: nurse.patients,
                       head_nurse: nurse.head_nurse
                   })
    end
    render json: @nurses
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

  private

  def nurse_params
    params.require(:nurse).permit(
        :name
    )
  end
end
