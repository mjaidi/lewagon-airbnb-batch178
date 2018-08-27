class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
  end

  def new
    @booking = Booking.new
  end

  def show
    @booking = Booking.find(params[:id])
    @review = Review.new
    @apartment = Apartment.all
  end
  def create
    @cbooking = Bookng.new(booking_params)
    if @booking.valid?
      @booking.save
      redirect_to booking_path(@booking)
    else
    render :new
    end
  end

  private
  def booking_params
    params.require(:booking).permit(:name)
  end
end
