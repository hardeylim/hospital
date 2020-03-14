# frozen_string_literal: true

class ChatRooms::MessageAdder < ChatRooms::Base
  def process(chat_room_id, message)
    validate_request(chat_room_id)
    message = @user.chat_messages.new(chat_room_id: @chat_room.id, message: message)
    if message.save
      message
    else
      @errors = message.errors.full_messages
    end
  end
end
