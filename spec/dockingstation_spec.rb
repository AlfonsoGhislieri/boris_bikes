require 'dockingstation'

describe DockingStation do
  it { expect(DockingStation.new).to respond_to :release_bike }
  
  it 'user gets bike' do
    bike = subject.release_bike
    expect(bike).to be_working
  end
  
  it 'lets the user dock a bike' do
    bike = Bike.new
    expect(subject.dock(bike)).to eq(bike)
  end

  it 'lets user see docked bike' do
    expect(subject).to respond_to :bike
  end
end




