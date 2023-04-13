# A method called count_words that takes a string as an argument 
# and returns the number of words in that string.

require "count_words"

RSpec.describe "count words method" do
  context "a string of 4 words is given" do
    it "returns 4" do
      result = count_words("My name is Andy")
      expect(result).to eq 4
    end
  end
  context "a string of 7 words is given" do
    it "returns 7" do
      result = count_words("My name is Andy and I'm Italian")
      expect(result).to eq 7
    end
  end
  context "no string is given" do
    it "returns a fail message" do
    expect{ count_words(nil) }.to raise_error "no string found"
    end
  end
end

