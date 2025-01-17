class Review < ApplicationRecord

  belongs_to :restaurant
  belongs_to :customer
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  validates :body, presence: true

end
