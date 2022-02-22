# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

Review.destroy_all
Booking.destroy_all
Pokemon.destroy_all
User.destroy_all

5.times do
  user = User.new(name: Faker::Name.name, email: Faker::Internet.email, password: Faker::Name.name)
  user.save!

  rand(1..10).times do
    pokemon = Pokemon.new(name: Faker::Games::Pokemon.name, description: Faker::TvShows::BojackHorseman.quote, photo_url: "https://picsum.photos/200", price: rand(50..1000), user: user)
    pokemon.save!
      rand(0..3).times do
        booking = Booking.new(user: user, pokemon: pokemon)
        booking.start_date = Faker::Date.between(from: '2022-02-22', to: '2022-10-22')
        booking.end_date = Faker::Date.between(from: '2022-10-23', to: '2023-10-22')
        booking.save!
        review = Review.new(content: Faker::TvShows::BojackHorseman.quote, rating: rand(1..5), booking: booking)
        review.save!
      end
  end
end
