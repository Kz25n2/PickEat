class Public::RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.where(is_active: true)
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    @reviews = @restaurant.reviews.order(created_at: :desc).limit(5)
  end
end
