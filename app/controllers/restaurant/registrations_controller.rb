# frozen_string_literal: true

class Restaurant::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  def create
    if params[:restaurant][:parking_lot] == false
      params[:restaurant][:parking_spaces] = 0
    end
    # parking_lotがtrueの場合のみparking_spacesを必須にする
    if params[:restaurant][:parking_lot] == true && params[restaraunt][parking_lot].blank?
      @restaurant = build_resouce(sign_up_params)
      @restaurant.errors.add(parking_spaces, "は必須です")
      render :new
      return
    end

    super # 他の処理（ユーザー作成処理）をそのまま呼び出す
  end

  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  # def create
  #   super
  # end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [
      :name, 
      :genre_id,
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
    ])
  end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
