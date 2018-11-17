class CreateShares < ActiveRecord::Migration[5.2]
  def change
    create_table :shares do |t|
      t.integer :wish_list_id, null: false
      t.integer :user_id, null: false
      t.timestamps
    end
    add_index :shares, [:wish_list_id, :user_id]
  end
end
