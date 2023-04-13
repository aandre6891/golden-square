# A method called make_snippet that takes a string as an argument 
# and returns the first five words and then a '...' 
# if there are more than that.

require "make_snippet"

RSpec.describe "make snippet method" do
  context "given an empty string" do
    it "returns an empty string" do
      result = make_snippet("")
      expect(result).to eq ""
    end
  end
  context "given a 5 words string" do
    it "returns the 5 words string" do
      result = make_snippet("My name is Andy Ruggieri")
      expect(result).to eq "My name is Andy Ruggieri"
    end
  end
  context "given a string with more than 5 words" do
    it "returns the first 5 words + ..." do
    result = make_snippet("My name is Andy and I'm Italian")
    expect(result).to eq "My name is Andy and..."
    end
  end
end