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
  end

  def new
    @pokemon = Pokemon.new
    @pokemon_list = PokemonList::LIST
  end

  def create
    @pokemon = Pokemon.new(pokemon_params)
    @pokemon.user_id = current_user.id

    if @pokemon.save
      redirect_to @pokemon, notice: "#{@pokemon.name} was successfully created."
    else
      render :new, notice: "Something went wrong. Try again."
    end
  end

  private

  def pokemon_params
    params.require(:pokemon).permit(:name, :description, :photo_url, :price)
  end
end
