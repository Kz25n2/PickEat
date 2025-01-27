class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  has_many :reviews, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :last_name_kana, presence: true
  validates :first_name_kana, presence: true
  validates :nickname, presence: true
  validates :telephone_number, presence: true
  validates :postal_code, presence: true
  validates :address, presence: true

  def formatted_postal_code
    postal_code.insert(3, '-') if postal_code.present?
  end

  scope :active, -> { where(is_active: true) }

  # ログイン可能かどうかを確認
  def active_for_authentication?
    super && is_active
  end

  # 退会済みユーザーに対するカスタムメッセージ
  def inactive_message
    is_active ? super : :inactive
  end

end
