class AddItem1ToFavorite < ActiveRecord::Migration
  def change
    add_column :favorites, :item_1, :string
  end
end
