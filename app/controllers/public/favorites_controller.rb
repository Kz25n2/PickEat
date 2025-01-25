class Public::FavoritesController < ApplicationController
  before_action :authenticate_customer!
  before_action :set_review, only: [:create, :destroy]

  def create
    favorite = current_customer.favorites.new(review: @review)
    favorite.save
    respond_to do |format|
      format.html { redirect_to request.referer }
      format.js
    end
  end

  def destroy
    favorite = current_customer.favorites.find_by(review: @review)
    favorite.destroy
    respond_to do |format|
      format.html { redirect_to request.referer }
      format.js
    end
  end

  private

  def set_review
    @review = Review.find(params[:review_id])
  end

end
