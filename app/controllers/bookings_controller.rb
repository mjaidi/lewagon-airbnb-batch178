
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
    differenceInDays = (end_date - start_date).to_i
    price_per_day = Apartment.find(params[:apartment_id]).price_per_day * differenceInDays
    price = price_per_day * number_guest
  
    @booking = Booking.new(start_date: start_date, end_date: end_date,number_guest: number_guest, total_price: price )
    @booking.user_id = current_user.id
    @booking.apartment_id = params[:apartment_id]
    
    if @booking.save
      redirect_to booking_trips_path(current_user.id)
    else
      flash[:error] = "Booking unsuccessful"
    end
    authorize @booking
  end

  private
  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :number_guest )
  end
end
