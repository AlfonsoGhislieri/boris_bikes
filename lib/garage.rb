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
end