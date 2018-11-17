class CreateWishLists < ActiveRecord::Migration[5.2]
  def change
    create_table :wish_lists do |t|
      t.string :name, null: false
      t.integer :user_id
      t.boolean :public, default: false
      t.timestamps
    end
    add_index :wish_lists, [:user_id]
  end
end
