class FlightsController < ApplicationController
  
    def index
      @flights = Flights.all
    end
  
    def show
      @ = .find(params[:id])
    end
  
    def create
      @ = .new(params[:])
    end
  
    def update
      @ = .find(params[:id])
    end
  
    def edit
      @ = .find(params[:id])
    end
  
    def destroy
       = .find(params[:id])
    end
end