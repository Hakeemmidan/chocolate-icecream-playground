require "test_helper"

class ProductTest < ActiveSupport::TestCase
  context "Validations" do
    should validate_presence_of(:title)
  end

  context "Associations" do
    should have_many(:reviews)
  end


  context "Database" do
    # If you're gonna change these, make sure you changes places that key into them
    # on the frontend and backend
    should have_db_column(:title).of_type(:string)
  end

  test "It gets saved properly when it has a title" do
    assert_equal "A Portfolio of Small Bets - The Course", products(:with_title).title
  end

  test "It marks products with no title as invalid" do
    subject = products(:with_title)
    subject.title = nil

    assert_not subject.valid?
  end
end
