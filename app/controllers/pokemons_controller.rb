class PokemonsController < ApplicationController
  def show
    @pokemon = Pokemon.find(params[:id])
    @booking = @pokemon.bookings.all
  end
end
