class RestaurantsController < ApplicationController

  def index
    @restaurants = Restaurant.all
  end

  def show

    @restaurant = Restaurant.find(params[:id])
    @markers = {
      lat: @restaurant.latitude,
      lng: @restaurant.longitude
     }
  end
end
