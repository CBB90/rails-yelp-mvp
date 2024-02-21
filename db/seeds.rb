# db/seeds.rb

# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

["chinese", "italian", "japanese", "french", "german"].each do |category_name|
  Restaurant.find_or_create_by!(category: category_name)
end

berlin_restaurants_data = [
  { name: "Curry 36", address: "Mehringdamm 36, 10961 Berlin", category: "german" },
  { name: "Ristorante Pizzeria", address: "Kastanienallee 123, 10435 Berlin", category: "italian" },
  { name: "Sakura Sushi", address: "Kurfürstendamm 123, 10711 Berlin", category: "japanese" },
  { name: "Le Lapin Saute", address: "Torstraße 123, 10119 Berlin", category: "french" },
  { name: "Great Wall", address: "Oranienburger Str. 45, 10178 Berlin", category: "chinese" }
]

berlin_restaurants_data.each do |restaurant_data|
  category_name = restaurant_data.delete(:category)
  category = RestaurantCategory.find_by(name: category_name)
  restaurant_data[:restaurant_category_id] = category.id if category

  Restaurant.find_or_create_by!(restaurant_data)
end

puts "Seeding complete"
