class ReviewsController < ApplicationController
  def new
    @product = Product.find(params[:product_id])
    # just renders the new review template
  end

  def create
    product = Product.find_by(id: params[:product_id])

    if !product
      render json: { errors: ["product_id can't be blank"] }, status: 422
    elsif review_params[:rating].nil?
      render json: { errors: ["Rating can't be blank"] }, status: 422
    else
      @review = product.reviews.new(review_params)

      if @review.save
        redirect_to product_path(product)
      else
        render json: { errors: @review.errors.full_messages }, status: 422
      end
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :body)
  end
end
