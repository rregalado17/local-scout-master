class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.string :content
      t.integer :user_id, foreign_key: true
      t.integer :tour_id, foreign_key: true
    end
  end
end
