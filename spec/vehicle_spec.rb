require './lib/vehicle'
require './lib/passenger'

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
end