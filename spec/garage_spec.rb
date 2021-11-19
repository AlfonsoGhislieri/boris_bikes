require 'garage'

describe Garage do
  before do
    @station = DockingStation.new
    @bike = Bike.new
    @van = Van.new
    @bike.report
    @station.dock(@bike)
    @van.send_broken_to_van(@station)
    subject.deliver_to_garage(@van)
  end

  it "after delivery, garage storage contains all broken bikes" do
    expect(subject.storage.include?(@bike)).to eq true
  end

  it "adds working bike to DockingStation" do
    bike2 = Bike.new
    subject.storage.push(bike2)
    subject.working_to_station(@station)
    expect(@station.bikes.include?(bike2)).to eq true
  end

  it "removes working bikes after they have been transported to station" do
    bike2 = Bike.new
    subject.storage.push(bike2)
    subject.working_to_station(@station)
    expect(subject.storage.include?(bike2)).to eq false
  end

end