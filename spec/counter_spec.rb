require 'counter.rb'

RSpec.describe Counter do
    it "should return 5" do
    counter = Counter.new
    counter.add(5)
    result = counter.report
    expect(result).to eq("Counted to 5 so far.")
  end
  it "should return 8" do
    counter = Counter.new
    counter.add(3)
    counter.add(5)
    result = counter.report
    expect(result).to eq("Counted to 8 so far.")
  end
end