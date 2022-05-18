require "faker"
require "open-uri"

patrons = ["Azat","Chris","Devin","Harry","Yuki","Nana","Bora","Reina","Shingo","Edmund","Tirso","James","Luis","Shinji","Kyle","Celso","Kenji","Shunjiro",]
shoe_name = ["Boots","Pumps","Sneakers","Heels","Flats","Sandals","Loafers","Moccasins","Platform Shoes","Clogs"]
shoe_categories = ["Dress","Casual", ]

puts 'Taking Shoes Off'
Shoe.destroy_all
puts "Killing users"
User.destroy_all


puts "Creating #{patrons.count} lives"
patrons.each do |patron|
  User.create!(
    name: patron,
    email: "#{patron}@shoesRcool.net",
    password: "123123",
  )
end
puts "...birthed #{User.count} unique, beautiful lives."

puts "Creating #{User.count} sexy shoes"
User.all.each do |user|
  Shoe.create!(
    name: shoe_name.sample,
    color: Faker::Color.color_name.capitalize,
    price: rand(10..200),
    size: rand(1..15),
    category: shoe_categories.sample,
    user_id: user.id
  )
end
puts "...created #{Shoe.count} pairs of shoes"

puts "Artifying #{Shoe.count} pairs of shoes"
Shoe.all.each do |shoe|
  file = URI.open("https://loremflickr.com/640/480/shoe")
  shoe.photo.attach(io: file, filename: "shoe.png", content_type: "image/png")
end
puts "#{Shoe.count} pairs of shoes, #{Shoe.count} pictures."

# puts "Creating rental agreement"
# Rental.destroy_all

# puts "Creating #{User.count} booking"
