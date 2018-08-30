class ApartmentsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :find_apartment, only: [:show, :update, :edit, :destroy, :fill_form]

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
      params[:apartment]["equip_ids"].each do |p|
        JoinAptEquip.create(apartment_id: @apartment.id, equip_id: p)
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
    if @apartment.update(apartment_params)
      params[:photos]['photo'].each do |a|
        @photo = @apartment.photos.create(photo: a)
      end

      joins = JoinAptEquip.where(apartment: @apartment)
      joins.each do |j|
         j.destroy
      end

      params[:apartment]["equip_ids"].each do |p|
        JoinAptEquip.create(apartment_id: @apartment.id, equip_id: p)
      end
      redirect_to apartment_path(@apartment)
    else
      render :edit
    end
  end

  def destroy
    @apartment.destroy
    redirect_to apartment_path(@apartment)
  end

  # def upload
  #   photo = Photo.new(apartment_id: apartment_params[:id])
  #   photo.remote_photo_url = apartment_params[:photo]
  #   photo.save
  # end

    private

  def apartment_params
    params.require(:apartment).permit(:bookings, :reviews, :equip_ids, :name, :address, :service_fees, :description, :price_per_day, :photo, photos_attributes: [:id, :apartment_id, :photo])
  end

  def find_apartment
    @apartment = Apartment.find(params[:id])
    authorize @apartment
  end
end
