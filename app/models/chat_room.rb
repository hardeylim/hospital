class ChatRoom < ApplicationRecord
  belongs_to 'Creator', class_name: 'User', foreign_key: 'creator_id'

  has_many :chat_room_users
  # inulit
  # has_many :users, through: :chat_room_users

  has_many :chat_messages
  has_many :users, through: :chat_messages

  validates :name, presence: true
end