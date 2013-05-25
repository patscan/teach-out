class AddSubjectFieldToMessageTable < ActiveRecord::Migration
  def change
    change_table :messages do |t|
      t.string :subject
    end
  end
end
