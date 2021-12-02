class AddRatingAndDescriptionToReviews < ActiveRecord::Migration[6.1]
  def change
    add_column :reviews, :rating, :integer
    add_column :reviews, :description, :text
  end
end
