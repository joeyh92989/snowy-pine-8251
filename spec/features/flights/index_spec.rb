require 'rails_helper'
    
RSpec.describe 'flight index' do
  before :each do
    FlightPassenger.destroy_all
    Passenger.destroy_all
    Flight.destroy_all
    Airline.destroy_all
    @airline_1 = Airline.create!(name: "Frontier")
    @flight_1 = @airline_1.flights.create!(number: "123", departure_city: "Chicago", arrival_city: "Denver")
    @flight_2 = @airline_1.flights.create!(number: "500", departure_city: "Chicago", arrival_city: "LA")
    @flight_3 = @airline_1.flights.create!(number: "200", departure_city: "Chicago", arrival_city: "NYC")
    @passenger_1 = Passenger.create!(name: "Joey")
    @passenger_2 = Passenger.create!(name: "Olivia")
    @passenger_3 = Passenger.create!(name: "KK")
    @passenger_4 = Passenger.create!(name: "Ryan")
    @passenger_5 = Passenger.create!(name: "Hannah")
    @passenger_6 = Passenger.create!(name: "Lindsay")
    @flight_passenger_1 = FlightPassenger.create!(flight: @flight_1, passenger: @passenger_1)
    @flight_passenger_2 = FlightPassenger.create!(flight: @flight_2, passenger: @passenger_2)
    @flight_passenger_3 = FlightPassenger.create!(flight: @flight_3, passenger: @passenger_3)
    @flight_passenger_4 = FlightPassenger.create!(flight: @flight_1, passenger: @passenger_2)
    @flight_passenger_5 = FlightPassenger.create!(flight: @flight_2, passenger: @passenger_1)
    @flight_passenger_6 = FlightPassenger.create!(flight: @flight_3, passenger: @passenger_3)

    visit "/flights"
  end
  describe 'Lists all Flights and details' do
    it 'lists all flights' do

      within "#flight-#{@flight_1.id}" do
        expect(page).to have_content("Flight Number: #{@flight_1.number}")
        expect(page).to have_content("Airline: #{@flight_1.airline.name}")
      end
        within "#passenger-#{@flight_1.id}-#{@passenger_1.id}" do
        expect(page).to have_content("Passenger: #{@passenger_1.name}")

      end
      within "#passenger-#{@flight_1.id}-#{@passenger_2.id}" do
        expect(page).to have_content("Passenger: #{@passenger_2.name}")
      end
    end
  end
  describe 'it can remove a passenger' do
    it 'has a button under each passenger to delete' do
      within "#passenger-#{@flight_1.id}-#{@passenger_1.id}" do
        expect(page).to have_button('Delete')
      end
    end
    it 'can delete an associations' do

      within "#passenger-#{@flight_1.id}-#{@passenger_1.id}" do
        click_button 'Delete'
      end

      expect(page).not_to have_selector("#passenger-#{@flight_1.id}-#{@passenger_1.id}")
    end
  end
end