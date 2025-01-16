class Public::RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.where(is_active: true)
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end
end
