# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Fridge.destroy_all

maytag = Fridge.create(location: "kitchen", brand: "Maytag", size:200, has_food: true, has_drink: true )

ge = Fridge.create(location: "garage", brand: "GE", size:150, has_food: true, has_drink: true )

pizza = Food.create(fridge_id: maytag.id, name: "pizza" , weight: 4 , vegan: false, time_added_to_fridge: Date.today)

kale = Food.create(fridge_id: ge.id, name: "kale", weight: 1, vegan: true, time_added_to_fridge: Date.today)

pasta = Food.create(fridge_id: maytag.id, name: "pasta" , weight: 1 , vegan: false, time_added_to_fridge: Date.today)

carrots = Food.create(fridge_id: ge.id, name: "carrots", weight: 2, vegan: true, time_added_to_fridge: Date.today)

white_wine = Drink.create(fridge_id: maytag.id, name: "Sauvignon Blanc", size: 32, alcoholic: true)

grapefruit_juice = Drink.create(fridge_id: ge.id, name: "Grapefruit Juice", size: 16, alcoholic: false)


pink_wine = Drink.create(fridge_id: maytag.id, name: "Rose", size: 32, alcoholic: true)

la_croix = Drink.create(fridge_id: ge.id, name: "La Croix", size: 16, alcoholic: false)
