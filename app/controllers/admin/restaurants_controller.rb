class Admin::RestaurantsController < ApplicationController
  before_action :authenticate_admin!

  def edit
    @restaurant = Restaurant.find(params[:id])
  end

  def update

    if params[:restaurant][:parking_lot].blank?
      params[:restaurant][:parking_lot] = 'false'
    end

    if params[:restaurant][:parking_lot] == 'false' && params[:restaurant][:parking_spaces].present?
      params[:restaurant][:parking_spaces] = 0
    end
  

    @restaurant = Restaurant.find(params[:id])
    if params[:restaurant][:parking_lot] == 'false'
      params[:restaurant][:parking_spaces] = 0
    end
    # parking_lotがtrueの場合のみparking_spacesを必須にする
    if params[:restaurant][:parking_lot] == 'true' && params[:restaurant][:parking_lot].blank?
      @restaurant = build_resouce(sign_up_params)
      @restaurant.errors.add(parking_spaces, "は必須です")
      render :new
      return
    end

    if @restaurant.update(restaurant_params)
      flash[:notice] = "更新に成功しました"
      redirect_to admin_top_path
    else
      flash.now[:alert] = "更新に失敗しました"
      render :edit
    end
  end

  def destroy
    @restaurant = Restaurant.find(params[:id])
    @restaurant.destroy
    flash[:notice] = "店舗の削除に成功しました"
    redirect_to admin_top_path
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(
      :name,
      :genre_id,
      :email,
      :postal_code,
      :address,
      :contact_number,
      :business_open_hours,
      :business_close_hours,
      :min_price,
      :max_price,
      :capacity,
      :parking_lot,
      :parking_spaces,
      :is_active
    )
  end

end
