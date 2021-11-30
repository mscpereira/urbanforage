class CreateRestaurantVibes < ActiveRecord::Migration[6.1]
  def change
    create_table :restaurant_vibes do |t|
      t.references :vibe, null: false, foreign_key: true
      t.references :restaurant, null: false, foreign_key: true

      t.timestamps
    end
  end
end
