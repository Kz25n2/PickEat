class Restaurant < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :genre
  has_many :reviews, dependent: :destroy
  has_many :coupons, dependent: :destroy
  has_many :promotions, dependent: :destroy

  validates :name, presence: true
  validates :genre, presence: true
  validates :email, presence: true
  validates :postal_code, presence: true
  validates :address, presence: true
  validates :contact_number, presence: true
  validates :min_price, presence: true
  validates :max_price, presence: true
  validates :capacity, presence: true
  validates :parking_spaces, presence: true, if: :parking_lot?

  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  def formatted_postal_code
    postal_code.insert(3, '-') if postal_code.present?
  end

  # ログイン可能かどうかを確認
  def active_for_authentication?
    super && is_active
  end

  # 退会済みユーザーに対するカスタムメッセージ
  def inactive_message
    is_active ? super : :inactive
  end

  scope :search_by_keyword, -> (keyword) {
    where("restaurants.name LIKE ? OR genres.name LIKE ? OR restaurants.address LIKE ?", "%#{keyword}%", "%#{keyword}%", "%#{keyword}%" ).joins(:genre)
  }

  scope :nearby, -> (latitude, longitude, distance) {
    near([latitude, longitude], distance, units: :km)
  }

  private
  
  def parking_lot?
    parking_lot == true
  end

end
