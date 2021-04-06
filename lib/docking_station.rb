require_relative 'bike'

class DockingStation
    attr_reader :bikes
    attr_reader :DEFAULT_CAPACITY
    #nil until dock is invoked
    def initialize(docking_val = 20)
      @bikes = []
      @DEFAULT_CAPACITY = docking_val
    end

    def dock(bike)
        fail 'docking station full' if full? #full? is a method
        # else, make arg the instance var @bike
        @bikes << bike
    end

    def release_bike
        fail 'No bikes in station' if empty?
        @bikes.pop
    end

    private
    def full?
      return @bikes.length >= @DEFAULT_CAPACITY
    end

    def empty?
      return @bikes.length == 0
    end
end

 # Define a full? predicate method
 # that uses some of the dock code
 # to return true or false depending
 # on whether the station is full or not
