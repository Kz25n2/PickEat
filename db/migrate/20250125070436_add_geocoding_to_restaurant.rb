class AddGeocodingToRestaurant < ActiveRecord::Migration[6.1]
  def change
    add_column :restaurants, :latitude, :float, null: false, default: 0
    add_column :restaurants, :longitude, :float, null: false, default: 0
  end
end
