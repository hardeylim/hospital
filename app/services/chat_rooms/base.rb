# frozen_string_literal: true

class ChatRooms::Base
  attr_reader :errors

  class InvalidRequest < StandardError; end

  def initialize(user)
    @user = user
    @errors = []
  end

  private

  #
  # 3 vinvalidate
  # lahat ng params dun sa request
  # chat_room_id, user_id, actor
  #
  def validate_request(chat_room_id, user_id = nil)
    @user = User.find(user_id) if user_id.present?
    @chat_room = ChatRoom.find(chat_room_id)
    raise InvalidRequest if user_in_chat(@user.id).nil?
  rescue ActiveRecord::RecordNotFound
    @errors.push('Invalid Request')
  rescue InvalidRequest
    @errors.push('Invalid Request')
  end

  def user_in_chat(user_id)
    @chat_room.active_users.where(user_id: user_id).first
  end
end
