class Review < ApplicationRecord
  belongs_to :pokemon, dependent: :destroy
  validates :content, :rating, presence: true
  validates :content, length: { minimum: 6 }
  validates :rating, numericality: { greater_that_or_equal_to: 0, less_than: 6 }
  # validates :pokemon, presence: true
  # , inclusion  in { 0..5 }
end
