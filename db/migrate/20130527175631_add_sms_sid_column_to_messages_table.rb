class AddSmsSidColumnToMessagesTable < ActiveRecord::Migration
  def change
    add_column :messages, :sms_sid, :string
  end
end
