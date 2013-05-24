class AddSchoolColumnToTeachersTable < ActiveRecord::Migration
  def change
    add_column :teachers, :school_name, :string
  end
end
