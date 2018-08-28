class ApplicationController < ActionController::Base
  protect_from_forgery
  before_action :authenticate_user!, :init_search
  def init_search
    @search = true
  end
end
