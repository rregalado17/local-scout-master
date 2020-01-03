class AddUserIdToTours < ActiveRecord::Migration[5.2]
  def change
    add_column :tours, :user_id, :integer
  end
end
