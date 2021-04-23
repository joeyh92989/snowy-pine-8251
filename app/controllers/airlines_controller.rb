class AirlinesController < ApplicationController 
  def show
    @airline = Airline.find(params[:id])
    @airline_passengers = @airline.passengers
    binding.pry
  end
end