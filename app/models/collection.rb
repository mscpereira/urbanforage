class Collection < ApplicationRecord
  belongs_to :user
  has_many :restaurant_collections, dependent: :destroy
  has_many :restaurants, through: :restaurant_collections
  acts_as_favoritable
end
