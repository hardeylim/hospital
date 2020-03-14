
class Api::ChatRoomsController < ApplicationController

  before_action :validate_user_in_chat, only: %i[add_user remove_user]
  
  def index
    render json: ChatRoom.order('id DESC')
  end

  def create
    chat_room = ChatRoom.new(creator_id: @user.id, name: params[:name])
    if chat_room.save
      render json: chat_room
    else
      render json: {errors: chat_room.errors}
    end
  end

  def update
  end

  def destroy
  end

  def add_user
  end

  def remove_user
  end

  private

  def validate_user_in_chat
    @chat_room = ChatRoom.find(params[:id])
    if @chat_room.active_users.where(user_id: @user.id).blank?
      render json: {errors: "user not in chat"}, status: 422
    end
  end


  # GET chat_rooms
  # GET chat_rooms/:id
  # POST chat_rooms
  # DELTE chat_rooms/:id
  # PATCH chat_rooms/:id

  # POST chat_rooms/:id/messages
  # DELETE chat_rooms/:id/messages/:id
end