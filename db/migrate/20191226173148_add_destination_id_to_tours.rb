class AddDestinationIdToTours < ActiveRecord::Migration[5.2]
  def change
    change_table :tours do |t|
      t.integer :destination_id
    end
  end
end
