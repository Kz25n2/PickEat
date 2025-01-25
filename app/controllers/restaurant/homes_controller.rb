class Restaurant::HomesController < ApplicationController
  before_action :authenticate_restaurant!
  
  def top
    @restaurant = current_restaurant
  end
end
