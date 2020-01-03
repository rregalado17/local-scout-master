class CreateTakeTours < ActiveRecord::Migration[5.2]
  def change
    create_table :take_tours do |t|

      t.timestamps
    end
  end
end
