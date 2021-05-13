# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

ListItem.create(description: "Relax in the sun")
ListItem.create(description: "Build a cat house")
ListItem.create(description: "Bike with the pups")
ListItem.create(description: "Plant tomatoes")


ListItem.create(description: "Dust", complete: true)
ListItem.create(description: "Become a cheerleader", complete: true)
ListItem.create(description: "Go on a cruise", complete: true)
