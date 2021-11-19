require 'garage'

describe Garage do
  before do
    @station = DockingStation.new
    @bike = Bike.new
    @van = Van.new
  end

  it "after delivery, garage storage contains all broken bikes" do
    @bike.report
    @station.dock(@bike)
    @van.send_broken_to_van(@station)
    subject.deliver_to_garage(@van)
    expect(subject.storage.include?(@bike)).to eq true
  end
end