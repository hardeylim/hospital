# frozen_string_literal: true

class Api::ChatRoomsController < ApplicationController

  def index
    render json: ChatRoom.order('id DESC')
  end

  def show
    @room = ChatRoom.find(params[:id])
    if @room.present?
      render json: @room
    else
      render json: { errors: 'room not found' }
    end
  end

  def create
    chat_room = ChatRoom.new(creator_id: @user.id, name: params[:name])
    if chat_room.save
      render json: chat_room
    else
      render json: { errors: chat_room.errors }
    end
  end

  def update; end

  def destroy; end

  def add_user
    @service = ChatRooms::Adder.new(@user)
    @service.process(params[:id], params[:user_id])
    if @service.errors.blank?
      render json: { success: true }
    else
      render json: { errors: @service.errors }, status: 422
    end
  end

  def remove_user
    @service = ChatRooms::Remover.new(@user)
    @service.process(params[:id], params[:user_id])
    if @service.errors.blank?
      render json: { success: true }
    else
      render json: { errors: @service.errors }, status: 422
    end
  end

  # GET chat_rooms
  # GET chat_rooms/:id
  # POST chat_rooms
  # DELETE chat_rooms/:id
  # PATCH chat_rooms/:id

  # POST chat_rooms/:id/messages
  # DELETE chat_rooms/:id/messages/:id
end
