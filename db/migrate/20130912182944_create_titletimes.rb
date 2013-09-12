class CreateTitletimes < ActiveRecord::Migration
  def change
    create_table :titletimes do |t|
      t.string :movie
      t.integer :hour
      t.integer :minute
      t.integer :second
      t.boolean :cheese

      t.timestamps
    end
  end
end
