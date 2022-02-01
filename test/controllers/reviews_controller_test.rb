require "test_helper"

class ReviewsControllerTest < ActionController::TestCase
  setup do
    @subject_product = products(:with_title)
  end

  context "GET new" do
    should "respond with 200 " do
      get :new, params: { product_id: @subject_product.id }
      assert_response 200
    end
  end

  context "POST create" do
    should "Restrict parameters on :review to rating, and body" do
      params = {
        product_id: @subject_product.id,
        review: {
          rating: 5,
          body: 'Great course'
        }
      }
      matcher = permit(:rating, :body).for(:create, params: params)
        .on(:review)

      assert_accepts matcher, subject
    end

    should "Responds with 422 when params are invalid" do
      # 'review.rating' param missing
      params = {
        product_id: @subject_product.id,
        review: {
          # rating: 5, # missing
          body: 'Great course'
        }
      }
      post :create, params: params
      assert_response 422
    end
  end
end
