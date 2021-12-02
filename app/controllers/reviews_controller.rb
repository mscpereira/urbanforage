class ReviewsController < ApplicationController
  before_action :find_restaurant
  # before_action :find_user

  # def new
  #   @review = Review.new
  #   # authorize @review
  # end

  def create
    @review = Review.new(review_params)
    @review.restaurant = @restaurant
    @review.user = current_user

    respond_to do |format|
      if @review.save
        format.html { redirect_to restaurant_path(@restaurant, anchor: "review")}
      else
        format.html { render 'restaurants/show' }
      end

      format.json
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
