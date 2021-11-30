class Vibe < ApplicationRecord
  has_many :restaurant_vibes
  has_many :restaurants, through: :restaurant_vibes
end
