class BookingsController < ApplicationController
  def index
    @bookings = current_user.bookings
  end

  def show
    set_booking
  end

  def create
    @booking = Booking.new(booking_params)
    @betweener = (@booking["end_date"] - @booking["start_date"]).to_i
    @pokemon = Pokemon.find(params[:pokemon_id])
    @booking.pokemon = @pokemon
    @booking.user = current_user
    if @booking.save
      redirect_to booking_path(@booking) # Not sure about the path here
    else
      render 'pokemons/show'
    end
  end

  # def destroy
  #   @booking = booking.find(params[:id])
  #   @booking.destroy
  #   redirect_to pokemon_path(@booking.pokemon)
  # end
  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
