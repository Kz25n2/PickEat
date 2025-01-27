class Public::PromotionsController < ApplicationController
  def index
    @promotions = if params[:nearby] == 'true' && customer_signed_in?

      current_location = [params[:latitude].to_f, params[:longitude].to_f]
      # 近くの店舗のIDを取得
      nearby_restaurants = Restaurant.near(
        current_location,
        180,
        units: :km
      )

      nearby_restaurant_ids = nearby_restaurants.map(&:id)
      
      Rails.logger.debug "Current Location: #{current_location}"
      Rails.logger.debug "Nearby Restaurant IDs: #{nearby_restaurant_ids}"

      # 近くの店舗のプロモーションを取得
      Promotion.active 
              .includes(:restaurant) 
              .where(restaurant_id: nearby_restaurant_ids) 
              .order(created_at: :desc) 
              .page(params[:page])

    else
      Promotion.active 
              .includes(:restaurant) 
              .order(created_at: :desc) 
              .page(params[:page])
    end
  end
end