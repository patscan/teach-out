class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :header
      t.string :content
      t.boolean :delivered
      t.datetime :time_sent
      t.references :teacher

      t.timestamps
    end
  end
end
