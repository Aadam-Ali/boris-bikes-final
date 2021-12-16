require_relative "bike"
class DockingStation
  attr_accessor :capacity

  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity 
  end

  def dock(bike)
    fail "Station full" if full?
    @bikes << bike 
  end 

  def release_bike
    fail 'No bikes available' if empty? || @bikes.all? { |bike| !bike.working? }
    i = @bikes.index { |bike| bike.working? }
    @bikes.delete_at(i)
  end 

  private 

  def full?
    @bikes.count >= DEFAULT_CAPACITY
  end 

  def empty?
    @bikes.empty?
  end 
  
end 
