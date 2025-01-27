
Geocoder.configure(
  # ジオコーディングサービスの設定
  lookup: :google,
  api_key: ENV['GEOCODING_API_KEY'],
  
  # 距離計算の単位
  units: :km,
  
  # キャッシュの設定
  cache: Redis.new,
  cache_prefix: 'geocoder:',
  
  # タイムアウトの設定
  timeout: 5,
  
  # 言語設定
  language: :ja
)