require_relative "../config/environment"
require_relative "../app/models/fridge"

puts "test"

def show_all_fridges
fridges = Fridge.all
    fridges.each do |fridge|
        puts "this #{fridge.brand} fridge is in the #{fridge.location}. This fridge's id is #{fridge.id}"
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

def delete_fridge()
    puts "Which fridge do you want to delete? Please enter the corresponding ID from below list"
    show_all_fridges
    delete_id = gets.chomp
    Fridge.find(delete_id).destroy
    puts "Fridge #{delete_id} has been deleted"
end


def view_food_in_fridge()
    puts "See the food in a fridge. Which fridge do you want to look in? Please enter the corresponding ID from below list"
        show_all_fridges
        fridge_to_see = gets.chomp.to_i
        
        food_list = Food.where("fridge_id = #{fridge_to_see}")
            food_list.each do |food|
                puts food.name
            end
end

def view_drinks_in_fridge()
    puts "See the drinks in a fridge. Which fridge do you want to look in? Please enter the corresponding ID from below list"
        show_all_fridges
        fridge_to_see = gets.chomp.to_i
        drink_list = Drink.where("fridge_id = #{fridge_to_see}")
            drink_list.each do |drink|
                puts drink.name
            end
end

def add_food_to_fridge()
    puts "Which refrigerator would you like to add a food to? Please enter the corresonding ID from below list"
    show_all_fridges
    fridge_to_add_to = gets.chomp.to_i
    puts "Name: "
    added_food_name = gets.chomp
    puts "Weight (in pounds): "
    added_food_weight = gets.chomp
    new_food = Food.create(name: added_food_name, weight: added_food_weight, fridge_id: fridge_to_add_to)
    puts "You've added a #{new_food.name} to fridge #{fridge_to_add_to}"
end

def add_drink_to_fridge()
    puts "Which refrigerator would you like to add a drink to? Please enter the corresponding ID from list below."
    show_all_fridges
    fridge_to_add_to = gets.chomp.to_i
    puts "Name: "
    added_drink_name = gets.chomp
    puts "Size (in ounces): "
    added_drink_size = gets.chomp
    new_drink = Drink.create(name: added_drink_name, size: added_drink_size, fridge_id: fridge_to_add_to)
    puts "Youve added a new #{new_drink.name} to fridge #{fridge_to_add_to}"
end 


def eat_a_food ()
    puts "Which fridge would you like a snack from? Please enter the corresonding ID from below list"
    show_all_fridges
    fridge_to_open = gets.chomp.to_i
    food_list = Food.where("fridge_id = #{fridge_to_open}")
    food_list.each do |food|
        puts "#{food.name} #{food.id}"
    end
    puts "Which food would you like to eat? Please enter ID below"
    food_to_eat = gets.chomp.to_i
    snack = Food.find(food_to_eat).destroy
    puts "You've eaten #{snack}"
end

def drink_part_of_drink()
    puts "Which fridge would you like a sip from? Please enter the corresonding ID from below list"
    show_all_fridges
    fridge_to_open = gets.chomp.to_i

    drink_list = Drink.where("fridge_id = #{fridge_to_open}")
    drink_list.each do |drink|
        puts "#{drink.name} #{drink.id}"
    end
    puts "Which drink would you like to taste? Enter ID"
    drink_to_try = gets.chomp.to_i
    drink_size = Drink.find(drink_to_try)
    ounces_left_to_drink = (drink_size.size - 5).to_f
    # drink_size.update(size: 10)
    puts ounces_left_to_drink
end 

def drink_whole_drink()
    puts "Which fridge would you like a sip from? Please enter the corresonding ID from below list"
    show_all_fridges
    fridge_to_open = gets.chomp.to_i
    drink_list = Drink.where("fridge_id = #{fridge_to_open}")
    drink_list.each do |drink|
        puts "#{drink.name} #{drink.id}"
    end
    puts "Which drink would you like to drink? Enter ID"
    drink_to_drink = gets.chomp.to_i
    Drink.find(drink_to_drink).destroy
    puts "You've drunk all of #{drink_to_drink}"
end
  

my_str = %q(
    Welcome to the Fridge Tracker
    What would you like to do?  
        1. List all Fridges
        2. Add a Fridge
        3. Delete a Fridge
        4. View food in a specific fridge
        5. Add a food item to a fridge
        6. Eat a food item from a fridge
        7. View all drink items in a specific fridge
        8. Add a drink to a specific fridge
        9. Drink part of a drink
        10. Drink an entire drink
        Select a number: 
)

puts my_str
user_descision = gets.chomp.to_i
puts user_descision

if user_descision == 1
    show_all_fridges
    elsif user_descision == 2
        add_fridge
    elsif user_descision == 3
        delete_fridge
    elsif user_descision == 4
        view_food_in_fridge
    elsif user_descision == 5
        add_food_to_fridge
    elsif user_descision == 6
        eat_a_food
    elsif user_descision == 7
        view_drinks_in_fridge
    elsif user_descision == 8
        add_drink_to_fridge
    elsif user_descision == 9
        drink_part_of_drink
    elsif user_descision == 10
        drink_whole_drink
    end
    
