class ReviewsController < ApplicationController
  before_action :find_restaurant
  # before_action :find_user

  def new
    @review = Review.new
    # authorize @review
  end

  def create
    @review = Review.new(review_params)
    @review.restaurant = @restaurant
    @review.user = current_user
    # authorize @review
    if @review.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new
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
