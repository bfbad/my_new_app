# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Product.create(:name => "seed-generated product", :description => "I also created this product without using the HTML form!",
	:colour => "Tan", :price => 1400.10, 
	:image_url: "https://brandonsbikes.herokuapp.com/assets/racebike-0a8f0f5fb70fe9c8961c372cc3271303459239c92fa9a8c6b2c5f370513737b8.png")