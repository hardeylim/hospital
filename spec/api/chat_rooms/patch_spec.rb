# frozen_string_literal: true

require 'rails_helper'

describe 'PATCH /api/chat_rooms/:id' do
  let!(:chatroom) { ChatRoom.create(name: 'NININ', creator_id: current_user.id) }
  let!(:room_params) { { 'name': 'my chat room' }.with_indifferent_access }

  context 'returns chat room object' do
    it 'should return 200' do
      auth_patch("/api/chat_rooms/#{chatroom.id}", room_params)
      expect(response.status).to eql 200
    end

    it 'should return chat room object' do
      auth_patch("/api/chat_rooms/#{chatroom.id}", room_params)
      chat_room = json_response
      expect(chat_room['id']).to_not be_nil
      expect(chat_room['name']).to eq room_params[:name]
    end
  end

  context 'returns chat room error' do
    it 'should return 422' do
      auth_patch("/api/chat_rooms/#{chatroom.id}", nil)
      expect(response.status).to eql 422
    end

    it 'should return error messages' do
      auth_patch("/api/chat_rooms/#{chatroom.id}", nil)
      expect(json_response['errors'].length).to be > 0
    end
  end
end
