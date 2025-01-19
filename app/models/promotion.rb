class Promotion < ApplicationRecord

  belongs_to :restaurant

  validates :name, presence: true
  validates :body, presence: true

end
