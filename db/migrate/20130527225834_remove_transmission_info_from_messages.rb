class RemoveTransmissionInfoFromMessages < ActiveRecord::Migration
  def up
    remove_column :messages, :delivered
    remove_column :messages, :sms_sid
  end

  def down
    add_column :messages, :sms_sid, :string
    add_column :messages, :delivered, :boolean
  end
end
