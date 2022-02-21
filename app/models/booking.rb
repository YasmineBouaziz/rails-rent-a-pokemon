class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :pokemon
  has_one :review
  validates :start_date, :end_date, presence: true
end
