class RestaurantsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]
  before_action :find_restaurant, only: %i[show]

  def index
    store_location_for(:user, restaurants_path)

    if params.keys.count == 2
      flash[:alert] = "You need to select at least one vibe!"
      redirect_to :vibes
    else
      @restaurants = []
      @vibes = []
      params.each_key do |key|
        if key.match(/vibe-\d+/)
          vibe = Vibe.find_by_name(params[key])
          @vibes << vibe.name
          @restaurants += vibe.restaurants
        end
        @restaurants.uniq!
      end
      @markers = @restaurants.map do |restaurant|
         {
          lat: restaurant.latitude,
          lng: restaurant.longitude,
          info_window: render_to_string(partial: "info_window", locals: { restaurant: restaurant })
        }
      end
    end
  end

  def show
    store_location_for(:user, restaurant_path)
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
