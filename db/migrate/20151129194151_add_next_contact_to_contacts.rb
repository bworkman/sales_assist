class AddNextContactToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :next_contact, :string
  end
end
