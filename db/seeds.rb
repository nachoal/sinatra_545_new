require 'faker'

# Create 10 restaurants...
puts 'Creating 10 restaurants...'
10.times do |time|
  puts "Creating the #{time +1} restaurant..."
  
  restaurant = Restaurant.new(
    name: Faker::Movie.title,
    city: Faker::Address.city
  )

  puts 'saving the restaurant to database...'
  restaurant.save
end