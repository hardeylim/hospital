# frozen_string_literal: true

require 'rails_helper'

describe 'GET /api/chat_rooms' do
  context 'returns chat rooms' do
    it 'returns chat rooms' do
      response = get('/api/chat_rooms')
      binding.pry
      expect(response).to eql 200
    end
  end
end
