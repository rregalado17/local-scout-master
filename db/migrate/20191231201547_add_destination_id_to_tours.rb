class AddDestinationIdToTours < ActiveRecord::Migration[5.2]
  def change
    add_column :tours, :destination_id, :integer
  end
end
