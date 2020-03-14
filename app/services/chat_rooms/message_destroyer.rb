# frozen_string_literal: true

class ChatRooms::MessageDestroyer < ChatRooms::Base
  def process(chat_room_id, message_id)
    validate_request(chat_room_id)
    message = @user.chat_messages.find(message_id)
    message.destroy
  rescue ActiveRecord::RecordNotFound
    @errors.push('Invalid Request')
  end
end
