class Favorite < ApplicationRecord

  belongs_to :customer
  belongs_to :review

  validates :customer_id, uniqueness: { scope: review_id }

  def favorited_by?(customer)
    favorites.exists?(customer_id: customer.id)
  end

end
