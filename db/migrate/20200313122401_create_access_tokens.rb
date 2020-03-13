class CreateAccessTokens < ActiveRecord::Migration[6.0]
  def change
    create_table :access_tokens do |t|
      t.string :token
      t.integer :user_id
      t.datetime :deleted_at
      t.timestamps
    end
  end
end
