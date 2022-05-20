require "faker"
require "open-uri"

patrons = ["Azat","Chris","Devin","Harry","Yuki","Nana","Bora","Reina","Shingo"]
shoe_name = ["Boots","Pumps","Sneakers","Heels","Flats","Sandals","Loafers",]
shoe_categories = [ "Dress","Casual", ]
colours = ["black", "brown", "gold", "cream", "green", "grey", "red", "yellow"]


puts 'Taking Shoes Off'
Shoe.destroy_all
puts "Killing users"
User.destroy_all

puts "Creating #{patrons.count} lives"
patrons.each do |patron|
  User.create!(
    name: patron,
    address: "#{Faker::Address.street_name}, #{Faker::Address.city}",
    phone: Faker::PhoneNumber.cell_phone,
    email: "#{patron}@shoesRcool.net",
    password: "123123",
  )
end
puts "...birthed #{User.count} unique, beautiful lives."

puts "Creating #{User.count} sexy shoes"
User.all.each do |user|
  Shoe.create!(
    name: shoe_name.sample,
    color: colours.sample,
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

puts "Artifying #{User.count} pairs of shoes"
User.all.each do |user|
  file = URI.open('https://thispersondoesnotexist.com/image')
  user.photo.attach(io: file, filename: "avatar.png", content_type: "image/png")
end
puts "#{User.count} pairs of shoes, #{User.count} pictures."
