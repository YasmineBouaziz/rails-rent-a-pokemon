# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

# Examples:

#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'
require 'json'
require 'rest-client'
require_relative 'pokemon-list'

Review.destroy_all
Booking.destroy_all
Pokemon.destroy_all
User.destroy_all

def fetcher(name)
  url = "https://pokeapi.co/api/v2/pokemon/#{name}"
  response = RestClient.get(url)
  pokemon_image = JSON.parse(response)["sprites"]["other"]["official-artwork"]["front_default"]
  if pokemon_image.present?
    return pokemon_image
  else
    fetcher(PokemonList::LIST.sample)
  end
end

5.times do
  user = User.new(name: Faker::Name.name, email: Faker::Internet.email, password: "bobbob")
  user.save!

  rand(1..30).times do
    rand_poke = PokemonList::LIST.sample
    pokemon = Pokemon.new(name: rand_poke, description: Faker::TvShows::BojackHorseman.quote, price: rand(50..500), user: user)
    pokemon.photo_url = fetcher(rand_poke)
    pokemon.save!
    puts "Success, saved #{pokemon.name.capitalize}"
      rand(0..3).times do
        booking = Booking.new(user: user, pokemon: pokemon)
        booking.start_date = Faker::Date.between(from: '2022-02-22', to: '2022-10-22')
        booking.end_date = Faker::Date.between(from: '2022-10-23', to: '2023-10-22')
        booking.save!
        review = Review.new(content: Faker::TvShows::BojackHorseman.quote, rating: rand(1..5), pokemon: pokemon)
        review.save!
      end
  end
end
