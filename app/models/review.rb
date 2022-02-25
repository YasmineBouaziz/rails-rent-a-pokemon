class Review < ApplicationRecord
  belongs_to :pokemon, dependent: :destroy
  validates :content, :rating, presence: true
  validates :content, length: { minimum: 6 }
  validates :rating, inclusion: { in: 0..5 }, numericality: { only_integer: true }
  # validates :pokemon, presence: true
  # , inclusion  in { 0..5 }
end
