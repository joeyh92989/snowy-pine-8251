require 'rails_helper'
    
RSpec.describe 'Airline show' do
  describe 'airline show' do
    it 'lists all passengers' do
      FlightPassenger.destroy_all
      Passenger.destroy_all
      Flight.destroy_all
      Airline.destroy_all    
      airline_1 = Airline.create!(name: "Frontier")   
      flight_1 = airline_1.flights.create!(number: "123", departure_city: "Chicago", arrival_city: "Denver")
      flight_2 = airline_1.flights.create!(number: "500", departure_city: "Chicago", arrival_city: "LA")
      flight_3 = airline_1.flights.create!(number: "200", departure_city: "Chicago", arrival_city: "NYC")
      passenger_1 = Passenger.create!(name: "Joey", age: 20)
      passenger_2 = Passenger.create!(name: "Olivia", age: 25)
      passenger_3 = Passenger.create!(name: "KK", age: 15)
      flight_passenger_1 = FlightPassenger.create!(flight: flight_1, passenger: passenger_1)
      flight_passenger_2 = FlightPassenger.create!(flight: flight_2, passenger: passenger_2)
      flight_passenger_3 = FlightPassenger.create!(flight: flight_3, passenger: passenger_3)
      flight_passenger_4 = FlightPassenger.create!(flight: flight_1, passenger: passenger_2)
      flight_passenger_5 = FlightPassenger.create!(flight: flight_2, passenger: passenger_1)
      flight_passenger_6 = FlightPassenger.create!(flight: flight_3, passenger: passenger_3)


      visit "/airlines/#{airline_1.id}"

      expect(page).to have_content("Passenger: #{passenger_1.name}")
      expect(page).to have_content("Passenger: #{passenger_2.name}")
    end
  end
end