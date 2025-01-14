class Admin::RestaurantsController < ApplicationController
  def show
    @restaurant = Restaurant.fint(params[:id])
  end

  def edit
    @restaurant = Restaurant.find(params[:id])
  end
end
