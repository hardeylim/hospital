class Api::HeadNursesController < ApplicationController

  def index
    render json: HeadNurses::Builder.new.index
  end

  def create
  end

  def delete
  end

end