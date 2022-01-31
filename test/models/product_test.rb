require "test_helper"

class ProductTest < ActiveSupport::TestCase
  test "It gets saved properly when it has a title" do
    assert_equal 'The Minimalist Entrepreneur', products(:with_title).title
  end

  test "It marks products with no title as invalid" do
    subject = products(:with_title)
    subject.title = nil

    assert_not subject.valid?
  end
end
