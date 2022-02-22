class Pokemon < ApplicationRecord
  validates :name, :description, :photo_url, presence: true
  # validates :name, uniqueness: true
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :reviews, through: :bookings
end
