class Restaurant < ApplicationRecord
  include PgSearch::Model
  has_many :reviews
  has_many :restaurant_vibes
  has_many :vibes, through: :restaurant_vibes
  has_many :photos
  # validates :photos, presence: true
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  pg_search_scope :search_by_name,
    against: [ :name ],
    using: {
      tsearch: { prefix: true }
    }
  # include AlgoliaSearch

  # algoliasearch do
  #   attributes :name
  # end
end
