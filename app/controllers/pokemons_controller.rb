require_relative '../../db/pokemon-list'

class PokemonsController < ApplicationController
  def index
    @pokemons = Pokemon.all
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
    # To writ if statement to fetch a picture from API, if no ohotos given by the user
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
    params.require(:pokemon).permit(:name, :description, :price, photos: [])
  end
end
