class AddActiveFieldToContactsTable < ActiveRecord::Migration
  def change
    change_table :contacts do |t|
      t.boolean :active
    end
  end
end
