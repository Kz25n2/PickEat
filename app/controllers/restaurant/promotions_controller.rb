class Restaurant::PromotionsController < ApplicationController
  def promotion
    @promotion = Promotion.new
    @promotions = current_restaurant.promotions.all
  end

  def create
    @promotion = current_restaurant.promotions.new(promotion_params)
    if @promotion.save
      flash[:notice] = "プロモーションを作成しました"
      @promotions = current_restaurant.promotions.all
      redirect_to promotion_restaurant_promotions_path
    else
      flash[:alert] = "プロモーションの作成に失敗しました"
      @promotions = current_restaurant.promotions.all
      render :promotion
    end
  end

  private
  
  def promotion_params
    params.require(:promotion).permit(:name, :body)
  end

end