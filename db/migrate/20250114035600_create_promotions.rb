class CreatePromotions < ActiveRecord::Migration[6.1]
  def change
    create_table :promotions do |t|
      t.integer :restaurant_id
      t.string :name
      t.text :body

      t.timestamps
    end
  end
end
