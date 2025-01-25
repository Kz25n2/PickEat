namespace :promotions do
  desc "Delete promotions order than 2 hours"
  task cleanup: :environment do
    delete_count = Promotion.where("created_at <= ?", 2.hours.ago).delete_all
    puts "#{Time.current}: #{deleted_count}件のプロモーションを削除しました"
  end
end