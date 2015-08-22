class AddItemReferenceToFavorites < ActiveRecord::Migration
  def change
    add_reference :favorites, :item, index: true, foreign_key: true
  end
end
