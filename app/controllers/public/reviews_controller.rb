class Public::ReviewsController < ApplicationController
  def index
    @reviews = Review.all
  end

  def show
    @review = Review.find(params[:id])
  end

  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = @restaurant.reviews.build(review_params)
    @review.customer_id = current_customer.id
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
    @restaurant = Restaurant.find(params[:restaurant_id])
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

  def review_params
    params.require(:review).permit(:body)
  end

end
