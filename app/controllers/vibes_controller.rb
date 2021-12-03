class VibesController < ApplicationController
  def index
    @vibes = Vibe.all
    @photos = Photo.all
    @restaurants = Restaurant.all
    @restaurantvibes = RestaurantVibe.all
  end
end
