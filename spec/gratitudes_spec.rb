require 'gratitudes'

RSpec.describe "Gratitudes" do
	it "should return 'Be grateful for: 'user inputs'" do
		gratitudes = Gratitudes.new
		gratitudes.add("friends")
		gratitudes.add("family")
		gratitudes.add("time")
		result = gratitudes.format
		expect(result).to eq("Be grateful for: friends, family, time")
	end
end