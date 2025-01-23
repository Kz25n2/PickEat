class Public::FavoritesController < ApplicationController
  before_action :authenticate_customer!

  def create
    review = Review.find(params[:review_id])
    favorite = current_customer.favorites.new(review_id: review.id)
    favorite.save
    redirect_to restaurant_review_path(review.restaurant, review)
  end

  def destroy
    review = Review.find(params[:review_id])
    favorite = current_customer.favorites.find_by(review_id: review.id)
    favorite.destroy
    redirect_to restaurant_review_path(review.restaurant, review)
  end

end
