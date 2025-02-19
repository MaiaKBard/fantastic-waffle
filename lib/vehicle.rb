class Vehicle
    attr_reader :year, :make, :model, :passengers

    def initialize(year, make, model)
        @speeding = false
        @passengers = []
    end

    def speeding?
        @speeding
    end

    def speed
        @speeding = true
    end

    def add_passenger(passenger)
        @passengers << passenger
    end

    def num_adults
        @passengers.count do |passenger|
            passenger.age >= 18
        end
    end
end