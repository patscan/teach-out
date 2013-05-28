class RemoveActiveColumnFromContacts < ActiveRecord::Migration
  def up
    remove_column :contacts, :active
  end

  def down
    add_column :contacts, :active, :boolean
  end
end
