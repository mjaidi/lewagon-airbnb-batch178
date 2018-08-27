class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
  end

  def new
    @booking = Booking.new
  end

  def show
    @booking = Booking.find(params[:id])
    end

  def create
    @cbooking = Bookng.new(booking_params)
    if @booking.save
      redirect_to booking_path(@booking)
    else
    render :new
    end
  end

  private
  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :status, :total_price, :apartment_id, :user_id, :created_at, :updated_at)
  end
end
