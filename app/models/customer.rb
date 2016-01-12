class Customer < ActiveRecord::Base
  belongs_to :dealership
  has_many :cars
end
