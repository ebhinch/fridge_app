require_relative "../config/environment"
require_relative "../app/models/fridge"

puts "test"

def show_all_fridges
fridges = Fridge.all
    fridges.each do |fridge|
        puts "this #{fridge.brand} fridge is in the #{fridge.location}."
    end
end

def add_fridge ()
    puts "Location: "
    location = gets.chomp
    puts "Brand: "
    brand = gets.chomp
    puts "Size: "
    size = gets.chomp.to_i
    puts "Does it have food? true/false: "
    has_food = gets.chomp
    puts "Does it have drinks? true/false: "
    has_drink = gets.chomp
    new_fridge = Fridge.create(location: location, brand: brand, size: size, has_food: has_food, has_drink: has_drink)
    puts new_fridge
end


my_str = %q(
    Welcome to the Fridge Tracker
    What would you like to do?  
        1. List all Fridges
        2. Add a Fridge
        3. Delete a Fridge
        Select a number: 
)

puts my_str
user_descision = gets.chomp.to_i
puts user_descision

if user_descision == 1
    show_all_fridges
    elsif user_descision == 2
        add_fridge
    end
    



# puts Fridge.all

# Fridge.create(
#     location: "office", 
#     brand: "whirlpool", 
#     size:250, 
#     has_food: false, 
#     has_drink:false
#     )