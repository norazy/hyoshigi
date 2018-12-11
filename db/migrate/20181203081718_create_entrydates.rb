class CreateEntrydates < ActiveRecord::Migration
  def change
    create_table :entrydates do |t|
      t.datetime :entrydate
      t.integer :capacity
      t.timestamps null: false
    end
  end
end
