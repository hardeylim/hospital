class ChatRoom < ApplicationRecord
  belongs_to :creator, class_name: 'User', foreign_key: 'creator_id'

  # has_many :chat_room_users
  # inulit
  # has_many :users, through: :chat_room_users
  #
  has_many :active_users, class_name: 'ChatRoomUser', foreign_key: 'chat_room_id'

  # ChatRoom.find(1).active_users()

  has_many :chat_messages
  has_many :users, through: :chat_messages

  # ChatRoom.find(1).users
  validates :name, presence: true

  after_create :set_initial_users

  def self.active_users_complete_details chat_room_id
    select("users.*").from("chat_rooms, chat_room_users, users").
    where("chat_rooms.id = chat_room_users.chat_room_id").
    where("users.id = chat_room_users.user_id").
    where("chat_rooms.id = ?", chat_room_id)
  end

  private

  def set_initial_users
    self.active_users.create(user_id: self.creator_id)
  end

end