class Restaurant < ApplicationRecord
  has_many :reviews
  has_many :restaurant_vibes
  has_many :vibes, through: :restaurant_vibes
  has_many_attached :photos
  # geocoded_by :address
  # after_validation :geocode, if: :will_save_change_to_address?
end
