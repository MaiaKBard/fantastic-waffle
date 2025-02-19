class Park
    attr_reader :name, :addmission_price, :vehicles

    def initialize(name, addmission_price)
        @name = name
        @addmission_price = addmission_price
        @vehicles = []
    end

    def add_vehicle(vehicle)
            @vehicles << vehicle
    end

    def list_vehicles
        @vehicles.each do |vehicle|
            vehicle
        end
    end

    def all_passengers
        all_passengers = []
        @vehicles.each do |vehicle|
            all_passengers << vehicle.passengers
        end
        all_passengers.flatten
    end

    def revenue
        revenue = 0
        @vehicles.each do |vehicle|
            vehicle.passengers.each do |passenger|
                if passenger.age >= 18
                    revenue += @addmission_price
                end
            end
        end
        revenue
    end
end