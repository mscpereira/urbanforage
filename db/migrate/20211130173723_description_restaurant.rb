class DescriptionRestaurant < ActiveRecord::Migration[6.1]
  def change
    add_column :restaurants, :description, :text
  end
end
