require_relative 'bike'

class DockingStation
  attr_reader :bikes

  def initialize
    @Storage = []
  end
  
  def release_bike
    raise "Empty DockingStation" unless @bikes
    @bikes
    
  end

  def dock(bike)
    raise "DockingStation full" if @storage.count > 20
    
    @storage << bikes
  end
end