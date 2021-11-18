require 'dockingstation'

describe DockingStation do
  
  context "Docking Bikes" do
    it 'lets the user dock a bike' do
      bike = double(:bike)
      subject.dock(bike)
      expect(subject.bikes.pop).to eq bike
    end

    it 'allows users to dock broken bikes' do
      bike = double(:bike)
      bike.report
      subject.dock(bike)
      expect(subject.bikes[0]).to eq bike
    end

    it 'lets user see docked bike' do
      expect(subject).to respond_to :bikes
    end

    describe '#dock' do
      it 'dockingstation does not accepts bikes if full' do
        DockingStation::DEFAULT_CAPACITY.times { subject.dock(double(:bike)) }
        expect { subject.dock(double(:bike)) }.to raise_error "DockingStation full"
      end
    end

  end
  
  context "Releasing Bikes" do
    it { expect(DockingStation.new).to respond_to :release_bike }
  
    it 'station releases bike' do
      bike = double(:bike)
      subject.dock(bike)
      expect(subject.release_bike).to eq bike
    end

    describe '#release_bike' do
      it 'returns error if empty dockingstation will release a bike' do
        expect { subject.release_bike }.to raise_error "Empty DockingStation" 
      end

      it 'only releases working bikes' do
        bike = double(:bike)
        bike.report
        station = DockingStation.new
        station.dock(bike)
        expect { station.release_bike }.to raise_error "Bike is broken, cannot release it"
      end  
    end
  

  context "Docking Station Capacity" do
    it "Allows user to set capacity of dockingstation" do
      station = DockingStation.new(30)
      expect(station.capacity).to eq 30 
    end
  
    it "Defaults to DEFAULTCAPACITY if no capacity is set" do
      station = DockingStation.new
      expect(station.capacity).to eq DockingStation::DEFAULT_CAPACITY 
    end
  end

end




