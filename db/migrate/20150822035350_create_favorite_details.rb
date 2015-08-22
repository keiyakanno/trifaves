class CreateFavoriteDetails < ActiveRecord::Migration
  def change
    create_table :favorite_details do |t|
      t.string :detail_number
      t.string :description
      t.integer :favorite_id

      t.timestamps null: false
    end
  end
end
