class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :first_name
      t.string :last_name
      t.string :company
      t.string :phone
      t.string :address
      t.text :note

      t.timestamps null: false
    end
  end
end
