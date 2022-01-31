require "test_helper"

class ReviewsControllerTest < ActionController::TestCase
  context "POST create" do
    should "Restrict parameters on :review to product_id, rating, and body" do
      params = {
        review: {
          product_id: products(:with_title).id,
          rating: 5,
          body: 'Great course'
        }
      }
      matcher = permit(:product_id, :rating, :body).for(:create, params: params)
        .on(:review)

      assert_accepts matcher, subject
    end

    should "Responds with 422 when params are invalid" do
      # 'review.rating' param missing
      params = {
        review: {
          product_id: products(:with_title).id,
          # rating: 5, # missing
          body: 'Great course'
        }
      }
      post :create, params: params
      assert_response 422

      # 'review.product_id' param missing
      params = {
        review: {
          # product_id: products(:with_title).id, # missing
          rating: 5,
          body: 'Great course'
        }
      }
      post :create, params: params
      assert_response 422
    end
  end
end
