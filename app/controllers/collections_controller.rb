class CollectionsController < ApplicationController

  def index
    @users = User.all
    @user = current_user
    @collections = Collection.where.not(user_id: current_user.id)
    @user_collections = Collection.where(user_id: current_user.id)
    @friends_collections = Collection.where(user_id: current_user.friends)
    # @restaurant_collections = RestaurantCollection.all
  end
end
