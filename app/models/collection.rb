class Collection < ApplicationRecord
  belongs_to :user
  has_many :restaurant_collections
  has_many :restaurants, through: :restaurant_collections
end
