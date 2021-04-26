class Airline < ApplicationRecord
  has_many :flights
  def passengers
    flights.joins(:passengers).where('passengers.age >= 18').select('passengers.*').distinct.pluck(:name)
  end
end
