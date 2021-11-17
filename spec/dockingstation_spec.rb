require 'dockingstation'

describe DockingStation do
  it { expect(DockingStation.new).to respond_to :release_bike }
  
  it 'station releases bike' do
    bike = Bike.new
    subject.dock(bike)
    expect(subject.release_bike).to eq bike
  end
  
  it 'lets the user dock a bike' do
    bike = Bike.new
    subject.dock(bike)
    expect(subject.bike).to eq bike
  end

  it 'lets user see docked bike' do
    expect(subject).to respond_to :bike
  end
    
  describe '#release_bike' do
      it 'returns error if empty dockingstation will release a bike' do
        expect { subject.release_bike }.to raise_error "Empty DockingStation" 
      end
  end
end




