class CreateRestaurantCollections < ActiveRecord::Migration[6.1]
  def change
    create_table :restaurant_collections do |t|
      t.references :restaurant, null: false, foreign_key: true
      t.references :collection, null: false, foreign_key: true

      t.timestamps
    end
  end
end
