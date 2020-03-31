class Api::TaskCommentsController < ApplicationController

  def index
    @task = Task.find(params[:id])
    render json: @task.task_comments
  end

  def create
    @task = Task.find(params[:id])
    render json: @task.task_comments.create(obj_params)
  end


  private

  def obj_params
    params.require(:task_comment).permit(
      :body,
      :user_id
    )
  end


end