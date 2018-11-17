class CreateWishes < ActiveRecord::Migration[5.2]
  def change
    create_table :wishes do |t|
      t.string :name, null: false
      t.integer :granter_id
      t.integer :wish_list_id, null: false
      t.timestamps
    end
    add_index :wishes, [:wish_list_id, :granter_id]
  end
end
