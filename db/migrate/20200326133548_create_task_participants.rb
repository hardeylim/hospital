class CreateTaskParticipants < ActiveRecord::Migration[6.0]
  def change
    create_table :task_participants do |t|
      t.integer :user_id
      t.integer :task_id
      t.integer :role_id
      t.timestamps
    end
  end
end
