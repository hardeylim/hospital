# frozen_string_literal: true

class Api::NursesController < ApplicationController
  def index
    @nurses = Nurse.all
    # res = []
    # Nurse.order('id DESC').each do |nurse|
    #   res.push({
    #              id: nurse.id,
    #              name: nurse.user.name,
    #              patients: nurse.patients
    #            })
    # end
    render json: @nurses
  end

  def show
    @nurse = Nurse.find(params[:id])

    render json: @nurse
  end

  def update

  end


end
