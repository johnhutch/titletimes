class ChangeDefaultsForTitletimes < ActiveRecord::Migration
  def change
    change_table :titletimes do |t|
      t.change :movie,  :string,   :null => false
      t.change :hour,   :integer,  :null => false
      t.change :minute, :integer,  :null => false
      t.change :second, :integer,  :null => false
      t.change :cheese, :cheese,   :null => false
    end
  end
end
