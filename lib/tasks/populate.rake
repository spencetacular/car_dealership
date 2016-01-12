namespace :populate do
  desc "Creates a fake dealership"
  task dealerships: :environment do
  
    Dealership.populate(3) do |dealership|
    dealership.name = Faker::Company.name + " Auto's"
    dealership.address = Faker::Address.street_name
    end

    puts 'Dealship Added'
  end

  desc "Creates 10 fake salespeople"
  task salesman: :environment do
    @Dealerships = Dealership.all
    @Dealerships.each do |dealership|
      Salesman.populate(10) do |salesman|
        salesman.first_name = Faker::Name.first_name
        salesman.last_name = Faker::Name.last_name
        salesman.total_sales = Faker::Number.between(1000, 100000)
        salesman.dealership_id = dealership.id
      end 
    end
    puts '10 salesman added to each dealership' 
  end

  desc "creates 10 fake cars for each delership"
  task cars: :environment do
    @Dealerships = Dealership.all
    @Dealerships.each do |dealership|
      Car.populate(10) do |car|
        car.make = 'Toyata'
        car.model = 'Tacoma'
        car.color = 'Blue'
        car.price = Faker::Number.between(500, 35000)
        car.sold = false
        car.dealership_id = dealership.id
      end 
    end
  end

  desc "Creates 10 fake customers for each dealership"
  task customers: :environment do
    @Dealerships = Dealership.all
    @Dealerships.each do |dealership|
      Customer.populate(10) do |customer|
        customer.first_name = Faker::Name.first_name
        customer.last_name = Faker::Name.last_name
        customer.phone_number = 5556732
        customer.email = Faker::Internet.email
        customer.dealership_id= dealership.id
      end
    end
    puts 'Created customers'
  end

  desc "Clears all poplulate entrys"
  task clear: :environment do
    Dealership.destroy_all
    Salesman.destroy_all
    puts 'Cleared'
  end

end
