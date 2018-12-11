class CreateInquiries < ActiveRecord::Migration
  def change
    create_table :inquiries do |t|
      t.string :lastname, null: false
      t.string :firstname, null: false
      t.string :lastnamekana, null: false
      t.string :firstnamekana, null: false
      t.string :email, null: false
      t.text :content, null: false
      t.timestamps null: false
    end
  end
end
