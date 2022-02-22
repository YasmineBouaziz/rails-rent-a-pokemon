class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # validates :name, :email, :password, presence: true
  # validates :email, uniqueness: true #removed name and password
  # validates :email, format: { with: /\A.*@.*\.com\z/ }
  has_many :pokemons
  has_many :bookings
  has_many :reviews, through: :bookings
end
