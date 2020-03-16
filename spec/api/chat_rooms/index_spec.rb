# frozen_string_literal: true

require 'rails_helper'

# if
# let!(:chatroom) { ChatRoom.create(name: 'NININ', creator_id: current_user.id) }
# create na agad is chat room kahit di sya ginamit
# if wala, use on demand.

describe 'GET /api/chat_rooms' do
  let!(:chatroom) { ChatRoom.create(name: 'NININ', creator_id: current_user.id) }

  context 'returns chat rooms' do
    it 'returns status 200' do
      auth_get('/api/chat_rooms')
      expect(response.status).to eql 200
    end

    it 'returns a chat room' do
      auth_get('/api/chat_rooms')
      chat_rooms = json_response
      expect(chat_rooms.length).to eql 1
      expect(chat_rooms[0]['id']).to eql chatroom.id
    end
  end
end
