class ChatRoom < ApplicationRecord
  belongs_to 'creator', class_name: 'User', foreign_key: 'creator_id'

  has_many :chat_room_users
  # inulit
  # has_many :users, through: :chat_room_users
  #
  has_many :active_users, class_name: 'User', foreign_key: 'user_id', through: :chat_room_users

  # ChatRoom.find(1).active_users()

  has_many :chat_messages
  has_many :users, through: :chat_messages

  # ChatRoom.find(1).users
  validates :name, presence: true
end