class PokemonsController < ApplicationController
  def new
    @pokemon = Pokemon.new
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
