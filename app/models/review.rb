class Review < ApplicationRecord
  validates :rating, presence: true, inclusion: 0..5

  belongs_to :product
end
