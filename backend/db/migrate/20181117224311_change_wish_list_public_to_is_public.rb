class ChangeWishListPublicToIsPublic < ActiveRecord::Migration[5.2]
  def change
    rename_column :wish_lists, :public, :is_public
  end
end
