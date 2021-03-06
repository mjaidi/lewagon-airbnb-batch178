require 'date'
class PagesController < ApplicationController
 skip_before_action :authenticate_user!, only: :home
  def home
    @search = false
    @apartments = policy_scope(Apartment)
    @apartments = @apartments.sample(6)

    @insolite = Apartment.where("address LIKE ?",'%Rouen%').sample(4)
    @boats = Apartment.where("address LIKE ?",'%Marseille%').sample(4)
  end

  def host
    @user = current_user
    @apartments = @user.apartments
    @apartment = Apartment.new
  end

  def trips
    @user = current_user
    @apartments = policy_scope(Apartment)
    @bookings = policy_scope(Booking)
    @bookings = @bookings.where(user_id: @user.id)
    @past_bookings = @bookings.where("start_date < ?", Date.today).order(start_date: :desc)
    @future_bookings =  @bookings.where("start_date >= ?", Date.today).order(start_date: :desc)
    @appt_reviews = ApptReview.new
  end

  def messages
    @user = current_user
  end
end
