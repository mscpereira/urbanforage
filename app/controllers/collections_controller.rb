class CollectionsController < ApplicationController
  before_action :set_collection, only: %i[show edit update destroy favorite]

  def index
    @users = User.all
    @user = current_user
    @collections = Collection.where.not(user_id: current_user.id)
    @user_collections = Collection.where(user_id: current_user.id)
    # @friends_collections = Collection.where(user_id: current_user.friends)
    @favorites = Favorite.where(favoritor_id: current_user.id)
    # @restaurant_collections = RestaurantCollection.all
  end

  def new
    @collection = Collection.new
    if params[:id].present?
      @restaurant_id = params[:id]
    end
  end

  def create
    @collection = Collection.new(collection_params)
    @collection.user = current_user
    if @collection.save
      if params[:collection][:id].present?
        @restaurant = Restaurant.find(params[:collection][:id])
        RestaurantCollection.create(restaurant: @restaurant, collection: @collection)
      end
      redirect_to collections_path
    else
      render :new
    end
  end

  def show
    @collections = Collection.where.not(user_id: current_user.id)
  end

  def favorite
    current_user.favorited?(@collection) ? current_user.unfavorite(@collection) : current_user.favorite(@collection)
    redirect_to collection_path(@collection)
  end

  def edit
  end

  def update
    @collection.update(collection_params)
    if @collection.update(collection_params)
      redirect_to collection_path(@collection)
    else
      render :edit
    end
  end

  def destroy
    @collection.destroy
    redirect_to collections_path
  end

  private

  def set_collection
    @collection = Collection.find(params[:id])
  end

  def collection_params
    params.require(:collection).permit(:name, :description)
  end
end
