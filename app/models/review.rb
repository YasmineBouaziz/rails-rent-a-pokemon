class Review < ApplicationRecord
  belongs_to :booking
  validates :content, :rating, presence: true
  validates :content, length: { minimum: 6 }
  validates :rating, numericality: { greater_that_or_equal_to: 0, less_than: 6 }
  # , inclusion  in { 0..5 }
end
