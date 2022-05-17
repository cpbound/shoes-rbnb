require "faker"

patrons = ["Azat","Christian","Devin","Hakuyo","Yuki","Nana","Bora","Reina","Shingo","Edmund","Tirso","James","Luis","Shinji","Kyle","Celso","Kenji","Shunjiro",]
shoe_name = ["Boots","Pumps","Sneakers","Heels","Flats","Sandals","Loafers","Moccasins","Platform Shoes","Clogs"]
shoe_categories = ["Dress","Casual", ]

puts "Creating users"
User.destroy_all

puts "Creating #{patrons.count} lives"
patrons.each do |patron|
  User.create!(
    email: "#{patron}@shoesRcool.net",
    password: "123123",
  )
end
puts "...created #{User.count} unique, beautiful lives."

# puts 'Taking Shoes Off'
# Shoe.destroy_all

# puts "Creating #{User.count} sexy shoes"
# User.all.each do |user|
#   Shoe.create!(
#     name: shoe_name.sample,
#     color: Faker::Color.color_name.capitalize,
#     price: rand(10..200),
#     size: rand(1..15),
#     category: shoe_categories.sample,
#     user_id: user.id
#   )
# end
# puts "...created #{Shoe.count} pairs of shoes"
