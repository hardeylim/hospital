# frozen_string_literal: true

class AlterHeadNurse < ActiveRecord::Migration[6.0]
  def change
    add_column :nurses, :head_nurse_id, :integer
    remove_column :head_nurses, :user_id
  end
end
