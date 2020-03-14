# frozen_string_literal: true

class Api::MessagesController < ApplicationController
  def create
    @service = ChatRooms::MessageAdder.new(@user)
    res = @service.process(params[:chat_room_id], params[:message][:body])
    if @service.errors.blank?
      render json: res
    else
      render json: { errors: @service.errors }, status: 422
    end
  end

  def destroy
    @service = ChatRooms::MessageDestroyer.new(@user)
    res = @service.process(params[:chat_room_id], params[:id])
    if @service.errors.blank?
      render json: res
    else
      render json: { errors: @service.errors }, status: 422
    end
  end
end
