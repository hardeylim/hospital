class CreateRavs < ActiveRecord::Migration[6.0]
  def change
    create_table :ravs do |t|

      t.timestamps
    end
  end
end
