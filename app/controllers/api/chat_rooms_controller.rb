
class Api::ChatRoomsController < ApplicationController

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


  # GET chat_rooms
  # GET chat_rooms/:id
  # POST chat_rooms
  # DELTE chat_rooms/:id
  # PATCH chat_rooms/:id

  # POST chat_rooms/:id/messages
  # DELETE chat_rooms/:id/messages/:id
end