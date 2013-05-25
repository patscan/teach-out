class AddTitleToTeachersTable < ActiveRecord::Migration
  def change
    change_table :teachers do |t|
      t.string :title
    end
  end
end
