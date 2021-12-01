class RestaurantsController < ApplicationController

  def index
    @restaurants = Restaurant.all
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
