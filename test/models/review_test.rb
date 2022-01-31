require "test_helper"

class ReviewTest < ActiveSupport::TestCase
  context "Validations" do
    should validate_presence_of(:rating)
    should validate_inclusion_of(:rating).in_range(0..5)
  end

  context "Associations" do
    should belong_to(:product)
  end

  context "Database" do
    should have_db_index(:product_id)
    should have_db_column(:product_id).of_type(:integer)
    # If you're gonna change these, make sure you changes places that key into them
    # on the frontend and backend
    should have_db_column(:rating).of_type(:integer)
    should have_db_column(:body).of_type(:text)
  end

  test "It gets saved properly when it has a rating" do
    assert_equal 5, reviews(:five_star_with_body).rating
  end

  test "It marks reviews with no rating as invalid" do
    subject = reviews(:five_star_with_body)
    subject.rating = nil
    
    assert_not subject.valid?
  end
end
