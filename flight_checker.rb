require './flight_planner.rb'
#*****Wyncode Written Test Method***********

def test_code(flight_planner_instance)
  planner = flight_planner_instance
  tests = [
    [:can_i_fly?, ["MIA", "JFK"], true],
    [:can_i_fly?, ["MIA", "ORD"], false],
    [:can_i_fly?, ["MIA", "XXX"], false]
]
  puts "All tests passing? Yes!" if tests.all? {|t| planner.send(t[0], *t[1]) == t[2]}
  #the 'send' method calls the method on the flight planner instance at the first index of tests array
  #with the arguments at the second index of tests, and checks if it's true to the third index

  failed_tests = tests.reject {|t| planner.send(t[0], *t[1]) == t[2]}
  response = "All tests passing? No...\n"
  response << "tests fail for: #{failed_tests.map{|t| t[1]}}"
  puts response if failed_tests != []
 
end

# ... get your flight planner class imported to this file
# ... instantiate a new flight planner object that is stored in a variable
# ... make a test of your own by looking at the code, it should use ==
# ... call test_code with your instance as the argument

jetblue = FlightPlanner.new

#*****my own test*********************
#does same thing as test_code but easier to understand. less efficient

def test_code2(flight_planner_instance)
  puts flight_planner_instance.can_i_fly?("MIA", "LAX") == false
  puts flight_planner_instance.can_i_fly?("PHX", "LAX") == true
end


#test_code(jetblue)
#tests pass proving method works.

jetblue.check_route("MIA", "LAX")
puts
jetblue.check_route("MIA", "FLL")
puts
jetblue.check_route("FLL", "ORD")
puts
jetblue.check_route("PHX", "MIA")

