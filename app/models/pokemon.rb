class Pokemon < ApplicationRecord

  validates :name, :description, :price, presence: true
  #validates :name, uniqueness: true
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :reviews
  has_many_attached :photos

  include PgSearch::Model
  pg_search_scope :search_pokemon,
    against: :name,
    associated_against: {
      user: [:name]
    },
    using: {
      tsearch: { prefix: true }
    }
  # PgSearch.multisearch_options = {
  #   using: [:tsearch, :trigram]
  # }
  # multisearchable against: [:name]
end
