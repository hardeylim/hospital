class Api::TaskCommentsController < ApplicationController

  def index
    @task = Task.find(params[:id])
    render json: @task.task_comments
  end

  def create
    @task = Task.find(params[:id])
    @comment = @task.task_comments.new(obj_params)
    if @comment.save
      render json: @comment
    else
      render json: {errors: @comment.error.full_messages}, status: 422
    end
  rescue ActiveRecord::RecordNotFound => e
    render json: {error: "Task Not Found", status: 403}
  end

  def destroy
    @task = Task.find(params[:task_id])
    @comment = @task.task_comments.find(params[:id])
    if @comment.destroy
      render json: {success: true}
    else
      render json: {errors: @comment.error.full_messages}, status: 422
    end
  rescue ActiveRecord::RecordNotFound => e
    render json: {error: "Task Not Found", status: 403}
  end


  private

  def obj_params
    params.require(:task_comment).permit(
      :body,
      :user_id
    )
  end


end