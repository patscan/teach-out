class CreateTeachers < ActiveRecord::Migration
  def change
    create_table :teachers do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password
      t.string :grade
      t.integer :zip

      t.timestamps
    end
  end
end
