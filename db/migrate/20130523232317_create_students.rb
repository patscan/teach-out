class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :first_name
      t.string :last_name
      t.references :teacher

      t.timestamps
    end
    add_index :students, :teacher_id
  end
end
