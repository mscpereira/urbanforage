class VibesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index]

  def index
    @vibes = Vibe.all
    @photos = Photo.all
    @restaurants = Restaurant.all
    @restaurantvibes = RestaurantVibe.all
  end
end
