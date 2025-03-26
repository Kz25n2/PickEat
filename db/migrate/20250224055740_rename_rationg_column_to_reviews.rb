class RenameRationgColumnToReviews < ActiveRecord::Migration[6.1]
  def change
    rename_column :reviews, :rationg, :rating
  end
end
