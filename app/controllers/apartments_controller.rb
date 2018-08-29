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
    @apartment = Apartment.find(params[:id])
  end

  def create
    @apartment = Apartment.new(apartment_params)
    @apartment.user = current_user
    if @apartment.save
      params[:photos]['photo'].each do |a|
          @photo = @apartment.photos.create!(photo: a)
       end
      redirect_to apartment_path(@apartment)
    else
      render :new
    end
    authorize @apartment
  end

  def new
    @apartment = Apartment.new
    authorize @apartment
    @photo = @apartment.photos.build
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
    params.require(:apartment).permit(:bookings, :reviews, :name, :address, :service_fees, :description, :price_per_day, :photo, photos_attributes: [:id, :apartment_id, :photo])
  end

  def find_apartment
    @apartment = Apartment.find(params[:id])
    authorize @apartment
  end
end
