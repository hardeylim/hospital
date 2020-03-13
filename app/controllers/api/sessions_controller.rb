class Api::SessionsController < ApplicationController

  skip_before_action :validate_request, only: [:create]

  def create
    user = User.find_by(basic_password: params[:password], email: params[:email])
    if user.present?
      token = user.access_tokens.create
      render json: {token: token}
    else
      render json: {errors: "Invalid Password or Email"}
    end
  end

end