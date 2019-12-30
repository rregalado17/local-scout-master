class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.string :content
      t.belongs_to :user, foreign_key: true
      t.belongs_to :tour, foreign_key: true
    end
  end
end
