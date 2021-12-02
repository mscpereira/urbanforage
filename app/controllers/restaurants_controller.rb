class RestaurantsController < ApplicationController
  before_action :find_restaurant, only: %i[show]

  def index
    if params.keys.count == 2
      flash[:alert] = "You need to select at least one vibe!"
      redirect_to :vibes
    else
      @restaurants = []
      params.each_key do |key|
        if key.match(/vibe-\d+/)
          vibe = Vibe.find_by_name(params[key])
          @restaurants += vibe.restaurants
        end
        @restaurants.uniq!
      end
    end
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    @review = Review.new
    @markers = {
      lat: @restaurant.latitude,
      lng: @restaurant.longitude
    }
  end

  private

  def find_restaurant
    @restaurant = Restaurant.find(params[:id])
  end
end
