require './lib/passenger'

# This block helps format the test results
RSpec.configure do |config|
  config.formatter = :documentation
end

# Your tests should start here!
RSpec.describe Passenger do 
  before(:each) do
    @passenger = Passenger.new({})
    @charlie = Passenger.new({"name" => "Charlie", "age" => 18})
    @taylor = Passenger.new({"name" => "Taylor", "age" => 12})
  end

  it 'exists' do
    expect(@passenger).to be_a(Passenger)
  end

  it 'has a name' do
    expect(@charlie.name).to eq("Charlie")
  end

  it 'has an age' do
    expect(@charlie.age).to eq(18)
  end

  it 'can determine if passanger is an adult' do
    expect(@charlie.adult?).to eq(true)
    expect(@taylor.adult?).to eq(false)
  end

  it 'can determine if passenger is a driver' do
    expect(@charlie.driver?).to eq(false)

    @charlie.drive

    expect(@charlie.driver?).to eq(true)
  end
end