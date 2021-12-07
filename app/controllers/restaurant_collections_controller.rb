class RestaurantCollectionsController < ApplicationController

  def new_restaurant_collection
    @collection = Collection.new(collection_params)
  end

  def create
    @restaurant = Restaurant.find(params[:restaurant])
    @collection = Collection.find(params[:collection_id])
    @restaurant_collection = RestaurantCollection.create(restaurant: @restaurant, collection: @collection)
  end

  def collection_params
    params.require(:collection).permit(:name, :description)
  end
end
