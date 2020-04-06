class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session

  before_action :authenticate_request


  def authenticate_request
    if current_user.blank?
      render json: {error: "Session Invalid"}, status: 401
    end
  end

  #
  # ||= OR EQUALS
  # INITAITE USER OR RETURN THE USER
  #
  def current_user
    # return @current_user if @current_user.present?
    # session = Session.where(token: request.headers['Authorization']).first
    # if session.present?
    #   @current_user = session.user
    # end
    @current_user ||= User.joins(:sessions).where("sessions.token = ?", request.headers['Authorization']).first
    # return @current_user if @current_user.present?
    # @current_user = = User.joins(:sessions).where("sessions.token = ?", request.headers['Authorization']).first
  end

end
