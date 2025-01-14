# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Adminの作成
Admin.find_or_create_by(email: "admin123@gmail.com") do |user|
  user.password = "admin123"
end

genres = [
  { name: '和食' },
  { name: '中華' },
  { name: '韓国料理' },
  { name: 'アジア料理' },
  { name: 'フレンチ' },
  { name: 'イタリアン' },
  { name: '寿司' },
  { name: '肉' },
  { name: '海鮮' },
  { name: '天ぷら' },
  { name: '蕎麦' },
  { name: 'うどん' },
  { name: 'ラーメン' },
  { name: 'パスタ' },
  { name: 'ピザ' },
  { name: 'カフェ' },
  { name: '居酒屋' },
  { name: 'ファミレス' },
  { name: 'バー' },
  { name: 'ファストフード' },
  # ここに他のジャンルを追加
]

genres.each do |genre|
  Genre.find_or_create_by!(genre)
end

Restaurant.delete_all

Restaurant.create!(
  name: "風味屋",
  genre: Genre.find(1), # 和食のジャンルIDを設定
  email: "info@fumiya.com",
  password: "password123",
  postal_code: "100-0001",
  address: "東京都千代田区千代田1-1-1",
  contact_number: "03-1234-5678",
  business_open_hours: "10:00",
  business_close_hours: "22:00",
  min_price: 500,
  max_price: 5000,
  capacity: 50,
  parking_lot: true,
  parking_spaces: 10,
)

Restaurant.create!(
  name: "海の幸ダイニング",
  genre: Genre.find(9),
  email: "info@uminosachi.com",
  password: "password123",
  postal_code: "150-0001",
  address: "東京都渋谷区神宮前1-2-3",
  contact_number: "03-2345-6789",
  business_open_hours: "11:00",
  business_close_hours: "23:00",
  min_price: 800,
  max_price: 4500,
  capacity: 40,
  parking_lot: false,
  parking_spaces: 0,
)

Restaurant.create!(
  name: "和風茶屋 さくら",
  genre: Genre.find(16),
  email: "info@sakura.com",
  password: "password123",
  postal_code: "162-0813",
  address: "東京都新宿区若葉町4-5-6",
  contact_number: "03-3456-7890",
  business_open_hours: "09:00",
  business_close_hours: "18:00",
  min_price: 600,
  max_price: 2500,
  capacity: 30,
  parking_lot: true,
  parking_spaces: 5,
)