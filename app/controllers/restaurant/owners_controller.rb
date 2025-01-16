class Restaurant::OwnersController < ApplicationController
  def edit
  end

  def unsubscribe
    @owner = current_restaurant
  end
end
