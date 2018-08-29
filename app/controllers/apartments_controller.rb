class ApartmentsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :find_apartment, only: [:show, :update, :edit, :destroy]

  def index
    @apartments = policy_scope(Apartment)
    if params[:query].present?
      sql_query = "description ILIKE :query OR address ILIKE :query"
      @apartments = Apartment.where(sql_query,query: "%#{params[:query]}%")
      @apartments = @apartments.where.not(latitude: nil, longitude: nil)

      @markers = @apartments.map do |flat|
        {
          lat: flat.latitude,
          lng: flat.longitude#,
          # infoWindow: { content: render_to_string(partial: "/apartments/map_box", locals: { flat: flat }) }
        }
      end
    else
      @apartments = Apartment.all
      @apartments = @apartments.where.not(latitude: nil, longitude: nil)

      @markers = @apartments.map do |flat|
        {
          lat: flat.latitude,
          lng: flat.longitude#,
          # infoWindow: { content: render_to_string(partial: "/apartments/map_box", locals: { flat: flat }) }
        }
      end
    end
  end

  def show
  end

  def create
    @apartment = Apartment.new(apartment_params)
    if @apartment.save
      redirect_to apartment_path(@apartment)
    else
      render :new
    end
    authorize @apartment
  end

  def new
    @apartment = Apartment.new
    authorize @apartment
  end

  def edit
  end

  def update
    if @apartment.update
      redirect_to apartment_path(@apartment)
    else
      render :edit
    end
  end

  def destroy
    @apartment.destroy
    redirect_to apartment_path(@apartment)
  end

    private

  def apartment_params
    params.require(:apartment).permit(:bookings, :photo, :reviews)
  end

  def find_apartment
    @apartment = Apartment.find(params[:id])
    authorize @apartment
  end
end
