class BookingsController < ApplicationController
  def index
    @bookings = current_user.bookings
  end

  def show
    set_booking
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end
end
