class Promotion < ApplicationRecord

  belongs_to :restaurant

  validates :name, presence: true
  validates :body, presence: true

  # 有効なプロモーションのみを取得するスコープ
  scope :active, -> { where("created_at > ?", 2.hours.ago) }

  # 期限切れのプロモーションを取得するスコープ
  scope :expired, -> { where("created_at <= ?", 2.hours.ago) }

end
