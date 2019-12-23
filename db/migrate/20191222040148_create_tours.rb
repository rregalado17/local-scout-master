class CreateTours < ActiveRecord::Migration[5.2]
  def change
    create_table :tours do |t|
      t.string :title
      t.string :destination
      t.integer :price
      t.integer :duration
      t.text :description
    end
  end
end
