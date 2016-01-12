class DealershipsController < ApplicationController
  def index
  	@dealerships = Dealership.all
  end

  def show
  	@dealership = Dealership.find(params[:id])
  	@cars = @dealership.cars
  	@customers = @dealership.customers

  end
end
