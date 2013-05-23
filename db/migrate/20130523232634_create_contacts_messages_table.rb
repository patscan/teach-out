class CreateContactsMessagesTable < ActiveRecord::Migration
  def change
    create_table :contacts_messages do |t|
      t.references :contact
      t.references :message
    end
  end
end
