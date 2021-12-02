class RestaurantsController < ApplicationController
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
      end
      @restaurants.uniq!
    end
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    @reviews_last = @restaurant.reviews.last(3)
    @markers = {
      lat: @restaurant.latitude,
      lng: @restaurant.longitude
     }
  end
end
