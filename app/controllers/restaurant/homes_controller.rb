class Restaurant::HomesController < ApplicationController
  def top
    @restaurant = current_restaurant
  end
end
