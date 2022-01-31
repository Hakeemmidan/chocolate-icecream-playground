class ReviewsController < ApplicationController
  def new
    # just renders the new review template
  end

  def create
    if review_params[:rating].nil?
      render json: { errors: ["Rating can't be blank"] }, status: 422
    elsif review_params[:product_id].nil?
      render json: { errors: ["product_id can't be blank"] }, status: 422
    else
      @review = Review.new(review_params)

      if @review.save
        render json: @review
      else
        render json: { errors: @review.errors.full_messages }, status: 422
      end
    end
  end

  private
  def review_params
    params.require(:review).permit(:product_id, :rating, :body)
  end
end
