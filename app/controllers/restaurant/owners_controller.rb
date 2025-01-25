class Restaurant::OwnersController < ApplicationController
  def edit
    @owner = current_restaurant
  end

  def update
    @owner = current_restaurant
    if @owner.update(restaurant_params)
      flash[:notice] = "店舗情報を更新しました。"
      redirect_to restaurant_top_path
    else
      flash.now[:alert] = "店舗情報の更新に失敗しました。"
      render :edit
    end
  end

  def unsubscribe
    @owner = current_restaurant
  end

  def withdrawal
    @owner = current_restaurant
    @owner.update(is_active: false)
    reset_session
    flash[:notice] = "退会処理が完了しました。"
    redirect_to root_path
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
      :parking_spaces
    )
  end

end
