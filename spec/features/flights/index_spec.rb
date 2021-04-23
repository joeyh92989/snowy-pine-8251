require 'rails_helper'
    
RSpec.describe 'flight index' do
  before :each do
    @airline_1 = Airline.create!(name: "Frontier")
    @flight_1 = @airline_1.flights.create!(number: "123", departure_city: "Chicago", arrival_city: "Denver")
    @flight_2 = @airline_1.flights.create!(number: "500", departure_city: "Chicago", arrival_city: "LA")
    @flight_3 = @airline_1.flights.create!(number: "200", departure_city: "Chicago", arrival_city: "NYC")
    @passenger_1 = @flight_1.passengers.create!(name: "Joey")
    @passenger_2 = @flight_1.passengers.create!(name: "Olivia")
    @passenger_3 = @flight_2.passengers.create!(name: "KK")
    @passenger_4 = @flight_2.passengers.create!(name: "Ryan")
    @passenger_5 = @flight_3.passengers.create!(name: "Hannah")
    @passenger_6 = @flight_3.passengers.create!(name: "Lindsay")
    visit "/flights"
  end
  describe 'Lists all Flights and details' do
    it 'lists all flights' do

      within "#flight-#{@flight_1.id}" do
        expect(page).to have_content("Flight Number: #{@flight_1.number}")
        expect(page).to have_content("Airline: #{@flight_1.airline.name}")
        expect(page).to have_content("Passenger: #{@passenger_1.name}")
        expect(page).to have_content("Passenger: #{@passenger_2.name}")
      end
      within "#flight-#{@flight_2.id}" do
        expect(page).to have_content("Flight Number: #{@flight_2.number}")
        expect(page).to have_content("Airline: #{@flight_2.airline.name}")
        expect(page).to have_content("Passenger: #{@passenger_3.name}")
        expect(page).to have_content("Passenger: #{@passenger_4.name}")
      end
      within "#flight-#{@flight_3.id}" do
        expect(page).to have_content("Flight Number: #{@flight_3.number}")
        expect(page).to have_content("Airline: #{@flight_3.airline.name}")
        expect(page).to have_content("Passenger: #{@passenger_5.name}")
        expect(page).to have_content("Passenger: #{@passenger_6.name}")
      end
    end
  end
  describe 'it can remove a passenger' do
    it 'a button under each passenger to delete' do
      save_and_open_page
      within "#flight-#{@flight_1.id}" do
        expect(page).to have_button('Delete')
      end
    end
  end
end