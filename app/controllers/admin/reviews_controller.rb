class Admin::ReviewsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @reviews = Review.all
  end

  def destroy
    review = Review.find(params[:id])
    review.destroy
    flash[:notice] = "レビューを削除しました"
    redirect_to admin_reviews_path
  end

  private

  def review_params
    params.require(:review).permit(:body)
  end

end
