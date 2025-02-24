class Public::ReviewsController < ApplicationController
  before_action :authenticate_customer!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_restaurant

  def index
    @reviews = Review.joins(:customer).where(restaurant_id: @restaurant.id, customers: { is_active: true })
  end

  def show
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = @restaurant.reviews.find(params[:id])
    @comments = @review.comments.joins(:customer).where(customers: { is_active: true })
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

  def is_matching_login_customer
    @customer = Customer.find(params[:id])
    unless @customer == current_customer
      redirect_to customer_path(current_customer)
    end
  end

end
