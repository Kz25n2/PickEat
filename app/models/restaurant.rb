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

  def formatted_postal_code
    postal_code.insert(3, '-') if postal_code.present?
  end

  private
  
  def parking_lot?
    parking_lot == true
  end

end
