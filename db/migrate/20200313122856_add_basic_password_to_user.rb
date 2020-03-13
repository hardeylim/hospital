class AddBasicPasswordToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :basic_password, :string
  end
end
