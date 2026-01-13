# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# 環境変数から値を取得
email = ENV["DEMO_USER_EMAIL"]
password = ENV["DEMO_USER_PASSWORD"]

# 両方の環境変数が設定されている場合のみ実行
if email.present? && password.present?
  # すでに同じメールアドレスのユーザーがいないか確認（二重登録防止）
  user = User.find_or_initialize_by(email_address: email)

  if user.new_record?
    user.password = password
    user.password_confirmation = password
    user.save!
    puts ">>> Success: Demo user created (#{email})"
  else
    puts ">>> Notice: Demo user already exists (#{email}), skipping seed."
  end
else
  puts ">>> Warning: DEMO_USER_EMAIL or DEMO_USER_PASSWORD not set. Seed skipped."
end
