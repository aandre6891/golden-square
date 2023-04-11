require 'check_codeword'

RSpec.describe "check_codeword" do
  it "returns 'Correct! Come in.' if the codeword is 'horse'" do
    result = check_codeword("horse")
    expect(result).to eq("Correct! Come in.")
  end
  it "returns 'Close, but nope.' if the codeword starts with 'h' and ends with 'e' but is not 'horse" do
    result = check_codeword("hype")
    expect(result).to eq("Close, but nope.")
  end
  it "returns 'WRONG!' if the codeword isn't horse and it doesn't start wit 'h' and ends with 'e'" do
    result = check_codeword("music")
    expect(result).to eq("WRONG!")
  end
end