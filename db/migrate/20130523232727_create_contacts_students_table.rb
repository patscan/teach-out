class CreateContactsStudentsTable < ActiveRecord::Migration
  def change 
    create_table :contacts_students do |t|
      t.references :contact
      t.references :student
    end
  end
end
