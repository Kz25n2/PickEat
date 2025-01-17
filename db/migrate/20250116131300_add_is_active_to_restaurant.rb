class AddIsActiveToRestaurant < ActiveRecord::Migration[6.1]
  def change
    add_column :restaurants, :is_active, :boolean, default: true, null: false
  end
end
