require 'dockingstation'

describe DockingStation do
  it 'releases a bike' do
    station = DockingStation.new
    expect(station).to respond_to :release_bike
  end
end