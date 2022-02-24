class Pokemon < ApplicationRecord
  validates :name, :description, :photo_url, :price, presence: true
  #validates :name, uniqueness: true
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :reviews
end
