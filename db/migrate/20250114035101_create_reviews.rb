class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.integer :restaurant_id
      t.integer :customer_id
      t.float :rationg
      t.text :body

      t.timestamps
    end
  end
end
