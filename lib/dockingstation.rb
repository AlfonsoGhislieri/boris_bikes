require_relative 'bike'

class DockingStation
  attr_reader :bikes
  def initialize
    @bikes = []
  end
  
  def release_bike
    raise "Empty DockingStation" if @bikes.empty?
    @bikes.pop
  end

  def dock(bike)
    raise "DockingStation full" if @bikes.length >= 20
    @bikes << bike
  end
end