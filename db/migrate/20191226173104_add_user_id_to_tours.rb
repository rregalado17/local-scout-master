class AddUserIdToTours < ActiveRecord::Migration[5.2]
  def change
    change_table :tours do |t|
      t.integer :user_id
    end
  end
end
