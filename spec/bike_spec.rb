require 'bike'

describe Bike do
  it { expect(Bike.new).to respond_to :working? }

  context "#report" do
    it "lets a user report a broken bike" do
      expect(Bike.new).to respond_to :report
    end
    
    it "when reported bike is set to broken" do
      bike = Bike.new
      bike.report
      expect(bike.broken).to eq true
    end
  end

end