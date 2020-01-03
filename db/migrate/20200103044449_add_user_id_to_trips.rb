class AddUserIdToTrips < ActiveRecord::Migration[5.2]
  def change
    add_column :trips, :user_id, :integer
  end
end
