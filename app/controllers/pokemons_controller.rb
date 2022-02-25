require_relative '../../db/pokemon-list'

class PokemonsController < ApplicationController
  def index
    @query = params["query"].nil? ? "" : params["query"]

    if @query.present? && @query["query"] != ""
      @pokemons = Pokemon.search_pokemon(@query["query"].downcase).sort_by{ |pokemon| pokemon.name }
    else
      @pokemons = Pokemon.all.reverse
    end
  end

  def show
    @pokemon = Pokemon.find(params[:id])
    @booking = Booking.new
    @review = Review.new
  end

  def new
    @pokemon = Pokemon.new
    @pokemon_list = PokemonList::LIST
  end

  def create
    # To write if statement to fetch a picture from API, if no photos given by the user
    @pokemon = Pokemon.new(pokemon_params)
    if Pokemon.where(photos: [])
      # @pokemon.photos.present?
      get_pokemon_photo(@pokemon.name)
    else
      @pokemon = Pokemon.new(pokemon_params)
    end
    @pokemon.user_id = current_user.id
    if @pokemon.save
      redirect_to @pokemon, notice: "#{@pokemon.name} was successfully created."
    else
      render :new, notice: "Something went wrong. Try again."
    end
  end

  private

  def pokemon_params
    params.require(:pokemon).permit(:name, :description, :price, :photo_url, photos: [])
  end

  def get_pokemon_photo(name)
    url = "https://pokeapi.co/api/v2/pokemon/#{name}"
    response = RestClient.get(url)
    pokemon_image = JSON.parse(response)["sprites"]["other"]["official-artwork"]["front_default"]
    if pokemon_image.present?
      @pokemon.photo_url = pokemon_image
    else
      fetcher(PokemonList::LIST.sample)
    end
  end
end
