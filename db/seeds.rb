# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'Seed started'
product = Product.create!(title: 'Programming Ruby 1.9 & 2.0')
review = product.reviews.create!(rating: 5, body: 'Great book')
review = product.reviews.create!(rating: 4, body: 'Good book')
review = product.reviews.create!(rating: 3, body: 'Not so good book')
review = product.reviews.create!(rating: 2, body: 'Bad book')
review = product.reviews.create!(rating: 1, body: 'Very bad book')
review = product.reviews.create!(rating: 0, body: "Don't even bother")
puts 'Seed ended'
