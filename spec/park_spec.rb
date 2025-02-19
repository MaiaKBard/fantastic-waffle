require './lib/park'
require './lib/vehicle'
require './lib/passenger'
require 'pry'

RSpec.describe Park do 
    before(:each) do
    @park = Park.new("Great Sand Dunes", 30) 

    @vehicle1 = Vehicle.new("2001", "Honda", "Civic")
    @vehicle2 = Vehicle.new("20016", "Honda", "Civic")
    @vehicle3 = Vehicle.new("2012", "Ford", "Explorer")

    @charlie = Passenger.new({"name" => "Charlie", "age" => 18})
    @jude = Passenger.new({"name" => "Jude", "age" => 20})
    @taylor = Passenger.new({"name" => "Taylor", "age" => 12})
    @chris = Passenger.new({"name" => "Chris", "age" => 21})
    end

    it 'exsists' do
        expect(@park).to be_a(Park)
    end

    it 'has a name' do
        expect(@park.name).to eq("Great Sand Dunes")
    end

    it 'had an addmission price' do 
        expect(@park.addmission_price).to eq(30)
    end

    describe '#vehicles' do
        it 'has vehicles come to the park' do
            expect(@park.vehicles).to eq([])
        end

        it 'can add vehicles to the park' do
            expect(@park.vehicles).to eq([])

            @park.add_vehicle(@vehicle1)
            @park.add_vehicle(@vehicle2)

            expect(@park.vehicles).to eq([@vehicle1, @vehicle2])
        end

        it 'can list vehicles entering the park' do
            @park.add_vehicle(@vehicle1)
            @park.add_vehicle(@vehicle2)
            @park.add_vehicle(@vehicle3)

            expect(@park.list_vehicles).to eq([@vehicle1, @vehicle2, @vehicle3])
        end
    end

    describe '#all_passengers' do
        it 'can list passengers in all vehicles in the park' do
            @park.add_vehicle(@vehicle1)
            @park.add_vehicle(@vehicle2)
            @park.add_vehicle(@vehicle3)

            expect(@park.list_vehicles).to eq([@vehicle1, @vehicle2, @vehicle3])

            @vehicle1.add_passenger(@charlie)
            @vehicle1.add_passenger(@taylor)
            @vehicle3.add_passenger(@jude)
            @vehicle2.add_passenger(@chris)

            expect(@park.all_passengers).to eq([@charlie, @taylor, @chris, @jude])        
        end
    end

    describe '#revenue' do
        it 'can add addmission prices from adults to equal the revenue' do
            @park.add_vehicle(@vehicle1)
            @park.add_vehicle(@vehicle2)
            @park.add_vehicle(@vehicle3)

            expect(@park.list_vehicles).to eq([@vehicle1, @vehicle2, @vehicle3])

            @vehicle1.add_passenger(@charlie)
            @vehicle1.add_passenger(@taylor)
            @vehicle3.add_passenger(@jude)
            @vehicle2.add_passenger(@chris)

            expect(@park.all_passengers).to eq([@charlie, @taylor, @chris, @jude]) 
            expect(@park.revenue).to eq(90)     
        end
    end
end