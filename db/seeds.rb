require "faker"

puts 'Taking Shoes Off'
Shoe.destroy_all

patrons = ["Azat","Christian","Devin","Hakuyo","Yuki","Nana","Bora","Reina","Shingo","Edmund","Tirso","James","Luis","Ricardo","Kyle","Celso","Kenji","Shunjiro",]
shoe_name = ["Boots","Pumps","Sneakers","Heels","Flats","Sandals","Loafers","Moccasins","Platform Shoes","Clogs"]
shoe_categories = ["Dress","Casual", ]

puts "Creating #{patrons.count}"
patrons.each do |patron|
  Shoe.create!(
    name: shoe_name.sample,
    color: Faker::Color.color_name.capitalize,
    price: rand(10..200),
    size: rand(1..15),
    category: shoe_categories.sample,
    user_id: 1
  )
end
puts "...created #{Shoe.count} pairs of shoes"
