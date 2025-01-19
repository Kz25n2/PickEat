class RemoveCouponIdFromRestaurants < ActiveRecord::Migration[6.1]
  def change
    remove_column :restaurants, :coupon_id, :integer, if_exists: true
  end
end
