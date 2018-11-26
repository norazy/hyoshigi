class CreateInfodownloads < ActiveRecord::Migration
  def change
    create_table :infodownloads do |t|
      t.string :lastname, null: false
      t.string :firstname, null: false
      t.string :email, null: false
      t.timestamps null: false
    end
  end
end
