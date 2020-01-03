class CreateTrips < ActiveRecord::Migration[5.2]
  def change
    create_table :trips do |t|
      t.string :name
      t.belongs_to :tour, foreign_key: true
      t.belongs_to :destination, foreign_key: true

      t.timestamps
    end
  end
end
