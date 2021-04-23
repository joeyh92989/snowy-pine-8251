require 'rails_helper'
    
RSpec.describe 'flight index' do
  before :each do
    airline_1 = Airline.create!(name: "Frontier")
    flight_1 = airline_1.flight.create!(number: "123", departure_city: "Chicago", arrival_city: "Denver")
    flight_2 = airline_1.flight.create!(number: "500", departure_city: "Chicago", arrival_city: "LA")
    flight_3 = airline_1.flight.create!(number: "200", departure_city: "Chicago", arrival_city: "NYC")
    binding.pry
    visit "/flights"
  end
  describe '$4' do
    it '$5' do
        
        
      within "#object-#{object.id}" do
        expect(page).to have_content(object.thing)
        expect(page).to have_link("link name or string")
        expect(page).to have_field('field_name')
        click_button 'Save'
      end
    end
  end
end