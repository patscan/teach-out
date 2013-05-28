class AddActiveColumnToContactsStudentsTable < ActiveRecord::Migration
  def change
    add_column :contacts_students, :active, :boolean, :default => false
  end
end
