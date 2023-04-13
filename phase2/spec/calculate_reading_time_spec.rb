require "calculate_reading_time"

RSpec.describe "calculate reading time method" do
  context "given no text" do
    it "returns zero" do
      result = calculate_reading_time("")
      expect(result).to eq 0
    end
  end 

  context "given a text of under two hundred words" do
    it "returns one" do
      result = calculate_reading_time("one")
      expect(result).to eq 1
    end
  end

  context "given a text of two hundred words" do
    it "returns one" do
      result = calculate_reading_time("one " * 200)
      expect(result).to eq 1
    end
  end

  context "given a text of three hundred words" do
    it "returns two" do
      result = calculate_reading_time("one " * 300)
      expect(result).to eq 2
    end
  end

  context "given a text of four hundred words" do
    it "returns two" do
      result = calculate_reading_time("one " * 400 )
      expect(result).to eq 2
    end
  end
end