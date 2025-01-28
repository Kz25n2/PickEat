class Restaurant::PromotionsController < ApplicationController
  before_action :authenticate_restaurant!
  before_action :is_matching_login_restaurant, only: [:destroy]


  def promotion
    @promotion = Promotion.new
    @promotions = current_restaurant.promotions.active
  end

  def create
    @promotion = current_restaurant.promotions.new(promotion_params)
    if current_restaurant.promotions.active.exists?
      flash.now[:alert] = "アクションは1件のみ作成できます。新しいアクションを作成したい場合は現在のアクションを削除してください。"
      @promotions = current_restaurant.promotions.active
      render :promotion
    elsif @promotion.save
      flash[:notice] = "アクションを作成しました。"
      @promotions = current_restaurant.promotions.active
      redirect_to promotion_restaurant_promotions_path
    else
      flash.now[:alert] = "アクションの作成に失敗しました。"
      @promotions = current_restaurant.promotions.active
      render :promotion
    end
  end

  def destroy
    @promotion = Promotion.find(params[:id])
    @promotion.destroy
    flash[:notice] = "アクションの削除に成功しました。"
    redirect_to promotion_restaurant_promotions_path
  end

  private
  
  def promotion_params
    params.require(:promotion).permit(:name, :body)
  end

  def is_matching_login_restaurant
    @restaurant = restaurant.find(params[:id])
    unless @restaurant == current_restaurant
      redirect_to restaurant_top_path(current_restaurant)
    end
  end

end