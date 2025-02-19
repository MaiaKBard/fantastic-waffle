require './lib/vehicle'
require './lib/passenger'
require 'pry'

RSpec.describe Vehicle do 
    before(:each) do
        @vehicle = Vehicle.new("2001", "Honda", "Civic")

        @charlie = Passenger.new({"name" => "Charlie", "age" => 18})
        @jude = Passenger.new({"name" => "Jude", "age" => 20})
        @taylor = Passenger.new({"name" => "Taylor", "age" => 12})
    end

    it 'exists' do
        expect(@vehicle).to be_a(Vehicle)
    end

    it 'can check if vehicle is speeding' do
        expect(@vehicle.speeding?).to eq(false)

        @vehicle.speed

        expect(@vehicle.speeding?).to eq(true)
    end

    it 'can have passengers' do
        expect(@vehicle.passengers).to eq([])
    end

    it 'can add passengers' do
        expect(@vehicle.passengers).to eq([])

        @vehicle.add_passenger(@charlie)
        @vehicle.add_passenger(@jude)
        @vehicle.add_passenger(@taylor)

        expect(@vehicle.passengers).to eq([@charlie, @jude, @taylor])
    end

    it 'can count the number of adults in the vehicle' do
        expect(@vehicle.passengers).to eq([])

        @vehicle.add_passenger(@charlie)
        @vehicle.add_passenger(@jude)
        @vehicle.add_passenger(@taylor)

        expect(@vehicle.passengers).to eq([@charlie, @jude, @taylor])
        expect(@vehicle.num_adults).to eq(2)
    end
end