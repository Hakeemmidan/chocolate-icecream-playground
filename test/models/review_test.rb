require "test_helper"

class ReviewTest < ActiveSupport::TestCase
  test "It gets saved properly when it has a rating" do
    assert_equal 5, reviews(:five_star_with_body).rating
  end

  test "It marks reviews with no rating as invalid" do
    subject = reviews(:five_star_with_body)
    subject.rating = nil
    
    assert_not subject.valid?
  end
end
