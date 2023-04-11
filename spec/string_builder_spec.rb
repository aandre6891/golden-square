require 'string_builder'

RSpec.describe StringBuilder do
  it "should return 'Hello, my name is Andy'" do
    string = StringBuilder.new
    string.add("Hello, my name is Andy")
    result = string.output
    expect(result).to eq("Hello, my name is Andy")      
  end
	it "should return 22" do
		string = StringBuilder.new
		string.add("Hello, my name is Andy")
		result = string.size
		expect(result).to eq(22)
	end
end