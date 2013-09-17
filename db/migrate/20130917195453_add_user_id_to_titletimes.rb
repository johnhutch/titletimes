class AddUserIdToTitletimes < ActiveRecord::Migration
  def change
    add_column :titletimes, :user_id, :integer
  end
end
