require_relative 'dockingstation'

class Garage
  attr_reader :storage
  def initialize
    @storage = []
  end

  def deliver_to_garage(van)
    van.holding.each do |bike| 
      @storage << bike
    end
    van.empty_van
  end

  def working_to_station(station)
    @storage.each { | bike| station.bikes << bike if bike.working? }
    @storage.select! { | bike | !bike.working? }
  end
end