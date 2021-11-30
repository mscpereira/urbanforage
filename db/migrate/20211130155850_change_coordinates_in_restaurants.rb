class ChangeCoordinatesInRestaurants < ActiveRecord::Migration[6.1]
  def change
    rename_column(:restaurants, :lat, :latitude)
    rename_column(:restaurants, :lon, :longitude)
  end
end
