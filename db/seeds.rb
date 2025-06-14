# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require 'faker'

puts "Seeding users and books..."

5.times do
  user = User.create!(
    name: Faker::Name.name,
    number: Faker::PhoneNumber.cell_phone_in_e164,
    email: Faker::Internet.unique.email,
    password: "password"
  )

  3.times do
    Book.create!(
      title: Faker::Book.title,
      author: user.name,
      description: Faker::Lorem.paragraph(sentence_count: 5),
      user: user
    )
  end
end

puts "Done seeding users and books!"AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?