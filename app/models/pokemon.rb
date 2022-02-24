class Pokemon < ApplicationRecord
  validates :name, :description, :photo_url, :price, presence: true
  # validates :name, uniqueness: true
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :reviews, through: :bookings

  include PgSearch::Model
  pg_search_scope :yo,
    against: :name,
    associated_against: {
      user: [:name]
    },
    using: {
      trigram: { prefix: true }
    }
  # PgSearch.multisearch_options = {
  #   using: [:tsearch, :trigram]
  # }
  # multisearchable against: [:name]
end
