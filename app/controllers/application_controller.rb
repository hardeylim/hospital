# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  
  before_action :validate_request

  private

  def validate_request
    @token = AccessToken.find_by(token: request.headers['Authorization'])
    if @token.present?
      @user = @token.user
    else
      render json: {error: "Invalid Token"}, status: 401
    end
  end

end
