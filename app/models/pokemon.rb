class Pokemon < ApplicationRecord
  validates :name, :description, :price, presence: true
  #validates :name, uniqueness: true
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :reviews
  has_many_attached :photos
end
