class CreateMessagesStudentsTable < ActiveRecord::Migration
  def change
    create_table :messages_students do |t|
      t.references :message
      t.references :student
    end
  end
end
