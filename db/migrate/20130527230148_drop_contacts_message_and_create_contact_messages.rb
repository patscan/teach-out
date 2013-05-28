class DropContactsMessageAndCreateContactMessages < ActiveRecord::Migration
  def up
    drop_table :contacts_messages

    create_table :contact_messages do |t|
      t.integer "contact_id"
      t.integer "message_id"
      t.integer "sms_sid"
      t.boolean "delivered"
    end
    add_index :contact_messages, [:contact_id, :message_id], :unique => true
  end

  def down

    drop_table :contact_messages

    create_table :contacts_messages do |t|
      t.integer "contact_id"
      t.integer "message_id"
    end
  end
end
