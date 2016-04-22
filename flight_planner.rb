#*************************************************************************************************************
#*****Suppose program is given flights for the day and user input for requested starts and destinations*******
#*************************************************************************************************************
require 'pp'
class FlightPlanner
  def initialize
    puts "Flights for Today: \n"
    @flights = {
      "MIA" => ["JFK", "PHX", "LHR", "FLL"],
      "AUS" => ["SFO", "ORD"],
      "FLL" => ["WPB", "AUS", "JFK"],
      "PHX" => ["SFO", "LAX", "LAS"]
    }
    pp @flights
    puts
  end


  def can_i_fly?(start, destination)
    @flights[start].include?(destination) 
  end

  def check_route(start, destination)
    puts "Checking flights for #{start} => #{destination}:"
    puts "-----------------------------------"
    if @flights[start].include?(destination) 
      puts "#{start} to #{destination} is a Direct Flight"

    else 
      connect = false
      #find key which contains the destination
      @flights.each do |key, value|
        if value.include?(destination)
          if @flights[start].include?(key)
            puts "You are going to have to take a flight from #{start} to #{key} then connect to #{destination}"
            connect = true
            break
          end
        end
      end

      puts "No Connecting Flights for #{start} to #{destination}" unless connect
    end
    puts " "
  end

end




