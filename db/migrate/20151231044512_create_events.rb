class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.string :note
      t.string :date
      t.string :time
      t.integer :user_id
      t.integer :contact_id

      t.timestamps null: false
    end
  end
end
