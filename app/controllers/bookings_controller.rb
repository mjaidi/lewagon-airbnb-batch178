
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
    start_date = Date.parse(params["booking"]["start_date"])
    end_date = Date.parse(params["booking"]["end_date"])
    number_guest = params["booking"]["number_guest"].to_i
    differenceInDays = end_date - start_date
    # pricePerDay = Apartment.id * differenceInDays
    price = differenceInDays * number_guest

    @booking = Booking.new(start_date: start_date, end_date: end_date,number_guest: number_guest )

    if @booking.save
      redirect_to booking_path(@booking)
    else
      flash[:error] = "Booking unsuccessful"

    end
    authorize @booking
    redirect_to apartment_booking_path
  end

  private
  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :number_guest )
  end
end
