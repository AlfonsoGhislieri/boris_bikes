require 'bike'

describe Bike do
  it 'checks if bike is working' do
    expect(Bike.new).to respond_to :working?
  end

end