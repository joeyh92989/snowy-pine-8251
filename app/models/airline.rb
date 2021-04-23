class Airline < ApplicationRecord
  has_many :flights
  def passengers
    flights.joins(:passengers).where('passengers.age >= 18').select('passengers.*').uniq.pluck(:name)
  end
end
