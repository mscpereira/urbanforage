class CreateRestaurants < ActiveRecord::Migration[6.1]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :cuisine
      t.text :address
      t.string :website
      t.integer :phone_number
      t.integer :menu
      t.string :price_range
      t.float :lat
      t.float :lon

      t.timestamps
    end
  end
end
