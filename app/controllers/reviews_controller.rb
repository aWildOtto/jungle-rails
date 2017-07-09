class ReviewsController < ApplicationController

  def new
  end

  def create
    review = Review.new(review_params)
    review.user_id = current_user.id
    if review.save!
      redirect_to product_url(review.product_id), notice: 'Review created!'
    else
      redirect_to product_url(review.product_id), notice: 'Review creation failed!'
    end
  end

  private
    def review_params
      params.require(:review).permit(
        :user_id, 
        :product_id, 
        :description, 
        :rating 
        )
    end


end
