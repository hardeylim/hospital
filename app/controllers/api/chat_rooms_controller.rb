
class Api::ChatRoomsController < ApplicationController

  def index
    render json: ChatRoom.order('id DESC')
  end

  def create
    ChatRoom.create(name: params[:name])
  end





  # GET chat_rooms
  # GET chat_rooms/:id
  # POST chat_rooms
  # DELTE chat_rooms/:id
  # PATCH chat_rooms/:id

  # POST chat_rooms/:id/messages
  # DELETE chat_rooms/:id/messages/:id
end