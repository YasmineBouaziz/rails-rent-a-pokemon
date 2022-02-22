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
end
