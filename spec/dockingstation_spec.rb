require 'dockingstation'

describe DockingStation do
  
  let(:bike) { double :bike }
  context "Docking Bikes" do
    it 'lets the user dock a bike' do
      subject.dock(bike)
      expect(subject.bikes.pop).to eq bike
    end

    it 'allows users to dock broken bikes' do
      allow(bike).to receive(:report)
      
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
    it { expect(subject).to respond_to :release_bike }
  
    it 'station releases bike' do
      allow(bike).to receive(:working?).and_return(true)
      subject.dock(bike)
      expect(subject.release_bike).to eq bike
    end

    describe '#release_bike' do
      it 'returns error if empty dockingstation will release a bike' do
        expect { subject.release_bike }.to raise_error "Empty DockingStation" 
      end

      it 'only releases working bikes' do
        bike = double(:bike, :report => nil, :working? => false)
        bike.report
        subject.dock(bike)
        expect { subject.release_bike }.to raise_error "Bike is broken, cannot release it"
      end  
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

  context "Handling Broken Bikes" do
    it "allows user to move broken bikes to van" do
      expect(subject).to respond_to :to_van
    end 
    it "it removes broken bikes to van holding" do
      station = DockingStation.new
      bike = Bike.new
      bike.report
      station.dock(bike)
      station.to_van
      expect(station.tempholding.include?(bike)).to eq true
    end
     
  end
end




