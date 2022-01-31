class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def show
    @product = Product.find_by(id: params[:id])

    if @product
      render :show
    else
      render json: { errors: ["Product not found"] }, status: 404
    end
  end
end