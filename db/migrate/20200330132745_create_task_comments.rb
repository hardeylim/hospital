class CreateTaskComments < ActiveRecord::Migration[6.0]
  def change
    create_table :task_comments do |t|
      t.integer :task_id
      t.integer :user_id
      t.text :body
      t.timestamps
    end
  end
end
