class Api::RavController < ApplicationController

  def index
    render json: {success: true, name: "hardey"}
  end

  def create
  end

end