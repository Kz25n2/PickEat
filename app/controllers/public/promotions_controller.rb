class Public::PromotionsController < ApplicationController
  def index
    @promotions = Promotion.active
  end
end
