class Admin::CustomersController < ApplicationController
  def index
    @customers = Customer.all
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      flash[:notice] = "会員情報を更新しました"
      redirect_to admin_customers_path
    else
      flash.now[:alert] = "会員情報の更新に失敗しました"
      render :edit
    end
  end

  def destroy
    @customer = Customer.find(params[:id])
    @customer.destroy
    flash[:notice] = "会員情報を削除しました"
    redirect_to admin_customers_path
  end

  private

  def customer_params
    params.require(:customer).permit(
      :last_name,
      :first_name,
      :last_name_kana,
      :first_name_kana,
      :nickname,
      :email,
      :telephone_number,
      :postal_code,
      :address,
      :is_active
    )
  end
  
end
