require_relative 'dockingstation'

class Van
  attr_reader :holding
  def initialize
    @holding = []
  end

  def send_broken_to_van(station)
    bike_array = station.bikes
    bike_array.each do | bike |
      @holding << bike if !bike.working? 
    end
    station.remove_broken_bikes
  end

  def empty_van
    @holding = []
  end
end