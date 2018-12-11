class CreateTrialdates < ActiveRecord::Migration
  def change
    create_table :trialdates do |t|
      t.datetime :trialdate
      t.integer :capacity
      t.timestamps null: false
    end
  end
end
