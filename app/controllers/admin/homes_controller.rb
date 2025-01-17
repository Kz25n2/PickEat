class Admin::HomesController < ApplicationController
  def top
    @restaurants = Restaurant.all
  end
end
