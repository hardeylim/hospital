# frozen_string_literal: true

class ChatRooms::Adder < ChatRooms::Base
  def process(chat_room_id, user_id)
    validate_request(chat_room_id, user_id)
    @chat_room_user = user_in_chat(user_id)
    if @chat_room_user.present?
      @errors.push('user already in chat')
    else
      ChatRoomUser.create(chat_room_id: chat_room_id, user_id: user_id)
    end
  end
end
