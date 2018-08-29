class BookingsController < ApplicationController
  def index
    @bookings = policy_scope(Booking)
  end

  def new
    @booking = Booking.new
    authorize @booking
  end

  def show
    @booking = Booking.find(params[:id])
    authorize @booking
  end

  def create
    @cbooking = Bookng.new(booking_params)
    if @booking.save
      redirect_to booking_path(@booking)
    else
    render :new
    end
    authorize @booking
    redirect_to apartment_booking_path
  end

  private
  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :status, :total_price, :apartment_id, :user_id, :created_at, :updated_at)
  end
end
