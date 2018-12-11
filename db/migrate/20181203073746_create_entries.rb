class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.string :p_lastname, null: false
      t.string :p_firstname, null: false
      t.string :p_lastnamekana, null: false
      t.string :p_firstnamekana, null: false
      t.string :email, null: false
      t.string :address, null: false
      t.string :phonenumber1, null: false
      t.string :phonenumber2, null: false
      t.string :phonenumber3, null: false
      
      t.string :lastname, null: false
      t.string :firstname, null: false
      t.string :lastnamekana, null: false
      t.string :firstnamekana, null: false
      t.date :birthday, null: false
      t.integer :gender, null: false
      t.integer :course, null: false
      t.date :joindate, null: false
      t.datetime :date, null: false
      t.string :securenumber, null: false
      t.timestamps null: false
    end
  end
end
