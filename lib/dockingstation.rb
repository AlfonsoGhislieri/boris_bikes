require_relative 'bike'
require_relative 'van'

class DockingStation
  DEFAULT_CAPACITY = 20
  attr_reader :bikes, :capacity, :tempholding
  
  def initialize(capacity = DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end
  
  def release_bike
    raise "Empty DockingStation" if empty?
    raise "Bike is broken, cannot release it" if not @bikes[0].working?
    @bikes.pop
  end

  def dock(bike)
    raise "DockingStation full" if full?
    @bikes << bike
  end

  def remove_broken_bikes
    @bikes.select! { | bike| bike.working? }
  end

  private 

  def full?
    @bikes.length >= DEFAULT_CAPACITY ? true : false
  end

  def empty?
    @bikes.empty? ? true : false
  end

end