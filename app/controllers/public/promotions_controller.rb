class Public::PromotionsController < ApplicationController
  def index
    @promotions = Promotion.all
  end
end
