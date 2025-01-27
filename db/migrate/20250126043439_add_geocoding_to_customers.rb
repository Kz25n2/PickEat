class AddGeocodingToCustomers < ActiveRecord::Migration[6.1]
  def change
    add_column :customers, :latitude, :float, null: false, default: 0
    add_column :customers, :longitude, :float, null: false, default: 0
  end
end
