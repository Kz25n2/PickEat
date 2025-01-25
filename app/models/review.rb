class Review < ApplicationRecord

  belongs_to :restaurant
  belongs_to :customer
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  validates :body, presence: true

  def favorited_by?(customer)
    return  false if customer.nil?
    favorites.exists?(customer_id: customer.id)
  end

end
