class AddValidationOnContactsTable < ActiveRecord::Migration

  def change
    add_index :contacts, [ :phone_number ], :unique => true
  end

end
