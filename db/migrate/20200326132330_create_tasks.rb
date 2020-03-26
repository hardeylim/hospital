class CreateTasks < ActiveRecord::Migration[6.0]
  def change

    # :werewr = sa ruby ito ay tawag na symbol
    # ang ibig sabihin ng symbol ay parang siyang glorified string
    # in short string lang siya talaga. haha. na madali GC ng ruby

    # tables must be PLURAL
    # and snake_case
    # if hindi mo spinecify ung primary key, lagi siyang ID
    # and lagi siyang ganon. do not overrider.

    create_table :tasks do |t|
      t.string :name
      t.integer :status_id
      t.timestamps
    end

  end
end
