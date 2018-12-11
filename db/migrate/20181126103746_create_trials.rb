class CreateTrials < ActiveRecord::Migration
  def change
    create_table :trials do |t|
      t.integer :age, null: false
      t.datetime :date, null: false
      t.string :lastname, null: false
      t.string :firstname, null: false
      t.string :email, null: false
      t.string :phonenumber1, null: false
      t.string :phonenumber2, null: false
      t.string :phonenumber3, null: false
      t.timestamps null: false
    end
  end
end
