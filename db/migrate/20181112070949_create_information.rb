class CreateInformation < ActiveRecord::Migration
  def change
    create_table :information do |t|
      t.string :lastname, null: false
      t.string :firstname, null: false
      t.string :lastnamekana, null: false
      t.string :firstnamekana, null: false
      t.string :email, null: false
      t.string :address, null: false
      t.string :phonenumber1, null: false
      t.string :phonenumber2, null: false
      t.string :phonenumber3, null: false
      t.timestamps
    end
  end
end
