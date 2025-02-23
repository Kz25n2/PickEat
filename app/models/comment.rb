class Comment < ApplicationRecord

  belongs_to :customer
  belongs_to :review

  validates :body, presence: true

end
