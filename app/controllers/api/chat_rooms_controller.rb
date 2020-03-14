
class Api::ChatRoomsController < ApplicationController

  before_action :validate_user_exists, only: %i[add_user remove_user]
  
  def index
    render json: ChatRoom.order('id DESC')
  end

  def show
    @room = ChatRoom.find(params[:id])
    if @room.present?
      render json: @room
    else
      render json: { errors: "room not found" }
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

  def update
  end

  def destroy
  end

  def add_user
    if user_is_in_chat
      render json: { errors: "user already in chat" }, status: 422
    else
      ChatRoomUser.create(chat_room_id: params[:id], user_id: params[:user_id])
      render json: { success: true }
    end
  end

  def remove_user
    @service = ChatRooms::Remover.new
    @service.remove_one(params[:id], params[:user_id])
    if @service.errors.length.zero?
      render json: { success: true }
    else
      render json: { errors: @service.errors }, status: 422
    end
  end

  private

  def user_is_in_chat
    @chat_room = ChatRoom.find(params[:id])
    # if @chat_room.active_users.where(user_id: @user.id).blank?
    #   render json: {errors: "user not in chat"}, status: 422
    # end
    #
    @chat_room.active_users.where(user_id: params[:user_id]).present?
  end

  def validate_user_exists
    @user = User.find(params[:user_id])
    if @user.blank?
      render json: { errors: "User does not exist" }, status: 422
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