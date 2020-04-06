class Api::TasksController < ApplicationController

  before_action :find_task, only: [:update,:destroy]
  #
  # REST dahil sa HTTP VERBS
  # defined convention
  #
  #
  # render json: access HASH/array of HASHES
  # BUT if activerecord array/object, automatic na niya i-serialize
  # serialization
  #
  # ANd controller should be SLIM
  # ung logics dapat wala sa controller
  # Service objects = PORO
  #
  def index
    render json: Tasks::Builder.new.build_index(current_user)
  end

  def show
    @task = current_user.tasks.find(params[:id])
    render json: @task
  rescue ActiveRecord::RecordNotFound => e
    render json: {error: "Task Not Found", status: 403}
  
    # @task = Task.where(id: params[:id]).first
    # if @task.present?
    #   render json: @task
    # else
    #   render json: {error: "Task Not Found", status: 403}
    # end
  end

  def create
    #
    # MASS ASSIGNMENT
    # GIVEN A JSON FROM EXTERNAL SOURCE, HINDI SIYA PDE DIRETSO I-MASS ASSIGN
    # STRONG PARAMETERS ung params.require
    #
    # ung unang if mo as much as possible hindi negative
    #

    # @task = Task.create(obj_params)
    # if @task.errors.present?
    #   render json: {errors: @task.errors.full_messages}, status: 422
    # else
    #   render json: @task
    # end

    @task = current_user.tasks.new(obj_params)
    if @task.save
      render json: @task
    else
      render json: {errors: @task.errors.full_messages}, status: 422
    end
  end

  def update
    service = Tasks::Updator.new(@task,current_user)
    res = service.update(obj_params)
    if service.errors.blank?
      render json: res
    else
      render json: {errors: service.errors}
    end
  end

  def destroy
    if @task.destroy
      render json: {success: true}
    else
      render json: {errors: @task.errors.full_messages}, status: 422
    end
  rescue ActiveRecord::RecordNotFound => e
    render json: {error: "Task Not Found", status: 403}
  end

  def in_progress
    render json: Task.where(status_id: 1)
  end

  private

  def find_task
    @task = current_user.tasks.find(params[:id])
  end

  def obj_params
    params.require(:task).permit(
      :name
    )
  end

end