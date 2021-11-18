require_relative 'bike'

class DockingStation
  attr_reader :bikes
  def initialize
    @bikes = []
  end
  
  def release_bike
    raise "Empty DockingStation" if empty?
    @bikes.pop
  end

  def dock(bike)
    raise "DockingStation full" if full?
    @bikes << bike
  end

  private 

  def full?
    @bikes.length >= 20 ? true : false
  end

  def empty?
    @bikes.empty? ? true : false
  end

end