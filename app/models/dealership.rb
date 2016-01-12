class Dealership < ActiveRecord::Base
	has_many :customers
	has_many :cars
	has_many :salesmen
end
