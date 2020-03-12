class CreateChatRooms < ActiveRecord::Migration[6.0]
  def change
    
    create_table :chat_rooms do |t|
      t.timestamps
      t.string :name
      t.integer :creator_id
    end

    create_table :chat_room_users do |t|
      t.integer :chat_room_id
      t.integer :user_id
      t.timestamps
    end

    create_table :chat_messages do |t|
      t.integer :chat_room_id
      t.integer :user_id
      t.text :message
      t.timestamps
    end

  end
end
