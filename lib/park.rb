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

end