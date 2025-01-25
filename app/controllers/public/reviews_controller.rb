class Public::ReviewsController < ApplicationController
  before_action :authenticate_customer!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_restaurant

  def index
    @reviews = Review.where(restaurant_id: @restaurant.id)
  end

  def show
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = @restaurant.reviews.find(params[:id])
    @comments = @review.comments.includes(:customer)
    @comment = @review.comments.new
  end

  def new
    @review = Review.new
  end

  def create
    @review = @restaurant.reviews.new(review_params)
    @review.customer = current_customer
    
    if @review.save
      flash[:notice] = "レビューを投稿しました。"
      redirect_to restaurant_path(@restaurant)
    else
      flash.now[:alert] = "レビューの投稿に失敗しました。"
      render :new
    end
  end

  def edit
    @review = Review.find(params[:id])
  end

  def update
    @review = Review.find(params[:id])
    if @review.update(review_params)
      flash[:notice] = "レビューを更新しました。"
      redirect_to restaurant_path(@restaurant)
    else
      flash.now[:alert] = "レビューの更新に失敗しました。"
      render :edit
    end
  end

  def destroy
    restaurant = Restaurant.find(params[:restaurant_id])
    review = Review.find(params[:id])
    review.destroy
    flash[:notice] = "レビューを削除しました。"
    redirect_to restaurant_path(restaurant)
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def review_params
    params.require(:review).permit(:body)
  end

end
