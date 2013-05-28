class RenameContactsStudentsTable < ActiveRecord::Migration
  def change
    rename_table :contacts_students, :contact_students
  end
end
