class AddDefaultValueToContactsTable < ActiveRecord::Migration
  def change
    change_column :contacts, :active, :boolean, :default => false
  end
end
