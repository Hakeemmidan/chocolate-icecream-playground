require "test_helper"

class ProductsControllerTest < ActionDispatch::IntegrationTest
  context "GET index" do
    should "respond with 200" do
      get products_path
      assert_response 200
    end
  end

  context "GET show" do
    should "respond with 200 for existing products" do
      get product_path(products(:with_title).id)
      assert_response 200
    end

    should "respond with 404 for non-existing products" do
      get product_path('fake-id')
      assert_response 404
    end
  end
end
