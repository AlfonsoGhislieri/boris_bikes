require 'van'
require 'dockingstation'


describe Van do
  before do
    @station = DockingStation.new
    @bike = Bike.new
  end

  context "Handling Broken Bikes" do
    it "allows user to move broken bikes to van" do
      expect(subject).to respond_to :send_broken_to_van
    end 
    
    it "it stores broken bikes in van" do
        @bike.report
        @station.dock(@bike)
        subject.send_broken_to_van(@station)
        expect(subject.holding.include?(@bike)).to eq true
    end

    it "does not store working bikes in van" do
        @station.dock(@bike)
        subject.send_broken_to_van(@station)
        expect(subject.holding.include?(@bike)).to eq false
    end

  end
end