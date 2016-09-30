class Vehicle
	attr_accessor :number_of_passengers, :number_of_drivers
	def initialize(number_of_passengers, number_of_drivers)
		@number_of_passengers = number_of_passengers
		@number_of_drivers = number_of_drivers
	end 
	def calculate_total_capacity()
		capacity = number_of_drivers + number_of_passengers
		puts "This vehicle can hold #{capacity} people."
	end
end 

my_vehicle = Vehicle.new(2,3)

puts my_vehicle.calculate_total_capacity()

class Spaceship < Vehicle 
	attr_accessor :location
	def initialize(number_of_passengers, number_of_drivers, location)
		puts "The initialize method is running!"
		super(number_of_passengers, number_of_drivers)
		@location = location 
		@inventory = []
	end 
	def shoot_lasers
		puts "Pew pew!"
	end 
	def warp_to(location)
		puts "Warping to #{location}!"
		@location = location 
	end
	def abduct_with_tractor_beam(object)
		@inventory << object
	end
	def pick_up(location, object)
		warp_to(location)
		abduct_with_tractor_beam(object)
		puts "Now you're in #{location} and you've picked up #{object}."
		puts "Your total inventory is #{@inventory}"
	end	
end

#optional challenge to print multiple new ones
#5.times {|i| puts Spaceship.new}

my_first_spaceship = Spaceship.new(5, 5, "Oakland")

my_first_spaceship.shoot_lasers

my_first_spaceship.warp_to("San Francisco")

puts my_first_spaceship.location

puts my_first_spaceship.abduct_with_tractor_beam("cow")
print my_first_spaceship.abduct_with_tractor_beam("another cow")

puts my_first_spaceship.pick_up("Iowa", "yet another cow")

puts my_first_spaceship.calculate_total_capacity()





