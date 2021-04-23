class FlightPassengersController < ApplicationController 
  def destroy
    flight = Flight.find(params[:flight_id])
    passenger = Passenger.find(params[:id])
    flight_passenger= FlightPassenger.where(flight: flight, passenger: passenger)
    FlightPassenger.delete(flight_passenger)
    redirect_to "/flights"
  end
end