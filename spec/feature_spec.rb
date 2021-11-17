require 'dockingstation'
require 'bike'

describe DockingStation do
  it 'if can add more then one bike' do
    station = DockingStation.new
    20.times { station.dock Bike.new }
  end
end