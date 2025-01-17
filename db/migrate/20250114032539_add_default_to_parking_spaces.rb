class AddDefaultToParkingSpaces < ActiveRecord::Migration[6.1]
  def change
    change_column_default :restaurants, :parking_spaces, from: nil, to: 0
  end
end
