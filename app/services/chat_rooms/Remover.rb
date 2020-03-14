# frozen_string_literal: true

class ChatRooms::Remover < ChatRooms::Base
  def process(chat_room_id, user_id)
    validate_request(chat_room_id, user_id)
    @chat_room_user = user_in_chat(user_id)
    if @chat_room_user.present?
      @chat_room_user.destroy
    else
      @errors.push('user not in chat')
    end
  end
end
