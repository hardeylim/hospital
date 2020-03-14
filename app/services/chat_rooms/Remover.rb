
class ChatRooms::Remover
  attr_reader :errors

  def initialize
    @errors = []
  end

  def  remove_one chat_room_id, user_id
    @chat_room = ChatRoom.find(chat_room_id)
    @chat_room_user = @chat_room.active_users.where(user_id: user_id)
    if @chat_room_user.present?
      ChatRoomUser.delete(@chat_room_user)
    else
      @errors.push('user not in chat')
    end
  end

end