class CreateTourDestinations < ActiveRecord::Migration[5.2]
  def change
    create_table :tour_destinations do |t|
      t.belongs_to :tour, foreign_key: true
      t.belongs_to :destination, foreign_key: true
    end
  end
end
