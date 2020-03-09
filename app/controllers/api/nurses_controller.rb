# frozen_string_literal: true

class Api::NursesController < ApplicationController
  def index
    # @nurses = Nurse.all
    @nurses = []
    Nurse.order('id DESC').each do |nurse|
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

  def update

  end


end
