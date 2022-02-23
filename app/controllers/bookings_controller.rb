class BookingsController < ApplicationController
  def index
    @bookings = current_user.bookings
  end

  def show
    set_booking
    @pokemon = @booking.pokemon
  end

  def set_booking
    @bookmark = Bookmark.find(params[:id])
  end

  def create
    @booking = Booking.new(booking_params)
    @pokemon = Pokemon.find(params[:pokemon_id])
    @booking.pokemon = @pokemon
    if @booking.save
      redirect_to home # Not sure about the path here
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

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end


end
