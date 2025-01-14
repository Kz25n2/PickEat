class CreateCoupons < ActiveRecord::Migration[6.1]
  def change
    create_table :coupons do |t|
      t.integer :restaurant_id
      t.string :name
      t.text :terms
      t.datetime :effective_date
      t.boolean :is_active

      t.timestamps
    end
  end
end
