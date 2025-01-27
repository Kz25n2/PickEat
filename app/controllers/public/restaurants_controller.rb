class Public::RestaurantsController < ApplicationController
  def index
    @genres = Genre.all
    if params[:nearby] == 'true' && current_customer

      current_location = [params[:latitude].to_f, params[:longitude].to_f]
      # 現在のユーザーの住所から近い店舗を取得
      @restaurants = Restaurant.near(
        current_location,
        180, # 10km以内
        units: :km
      ).page(params[:page])
    else
      @restaurants = Restaurant.page(params[:page])
    end
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    @reviews = @restaurant.reviews.order(created_at: :desc).limit(5)
  end

end
