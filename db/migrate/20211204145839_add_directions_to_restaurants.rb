class AddDirectionsToRestaurants < ActiveRecord::Migration[6.1]
  def change
    add_column :restaurants, :directions, :string
  end
end
