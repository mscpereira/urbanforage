class ReviewsController < ApplicationController
  before_action :find_restaurant, only: %i[index create]
  # before_action :find_user

  # def new
  #   @review = Review.new
  #   # authorize @review
  # end

  def index
    store_location_for(:user,restaurants_path)
    @pagy, @reviews = pagy(@restaurant.reviews.order(created_at: :desc), items: 6)
    @users = User.all
  end

  def create
    @marker = session[:marker]
    @review = Review.new(review_params)
    @review.restaurant = @restaurant
    @review.user = current_user

    respond_to do |format|
      if @review.save
        format.html { redirect_to restaurant_path(@restaurant, anchor: "review-#{@review.id}") }
        format.json
      else
        format.html { render 'restaurants/show' }
        format.json
      end
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :description)
  end

  def find_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  # def find_user
  #   @user = current_user.id
  # end
end
