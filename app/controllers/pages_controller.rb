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

  def messages
    @user = current_user
  end
end
