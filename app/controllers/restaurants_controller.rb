class RestaurantsController < ApplicationController

  def index
    @restaurants = Restaurant.all
  end

  def show
    @restaurant = Restautant.find(params[:id])
    @markers = {
      lat: @restaurant.lat,
      lng: @restaurant.lon
     }
  end

end
