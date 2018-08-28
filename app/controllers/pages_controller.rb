class PagesController < ApplicationController
 skip_before_action :authenticate_user!, only: :home
  def home
    @search = false
    @apartments = policy_scope(Apartment)
    @apartments = @apartments.sample(6)
  end
end
