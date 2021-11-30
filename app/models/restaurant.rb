class Restaurant < ApplicationRecord
  has_many :reviews
  has_many :restaurant_vibes
  has_many :vibes, through: :restaurant_vibes
  has_many_attached :photos
  validates :photos, presence: true
end
