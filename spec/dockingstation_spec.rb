require 'dockingstation'

describe DockingStation do
  it { expect(DockingStation.new).to respond_to :release_bike }
  
  it 'user gets bike' do
    bike = subject.release_bike
    expect(bike).to be_working

  end
end




