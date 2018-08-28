class ApartmentsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]  
  before_action :find_apartment, only: [:show, :update, :edit, :destroy]
  def index
    if params[:query].present?
      sql_query = "description ILIKE :query OR address ILIKE :query"
      @apartments = Apartment.where(sql_query,query: "%#{params[:query]}%")
    else
      @apartments = Apartment.all
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
  end

  def new
  @apartment = Apartment.new
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
  end
end
