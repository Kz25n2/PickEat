class Restaurant < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :genre
  has_many :reviews, dependent: :destroy
  has_many :coupons, dependent: :destroy
  has_many :promotions, dependent: :destroy

end
