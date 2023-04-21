require "track"

RSpec.describe Track do
  it "constructs" do
    track = Track.new("title1", "artist1")
    expect(track.title).to eq "title1"
    expect(track.artist).to eq "artist1"
  end
    
  describe "#matches?" do
    it "returns true since the keyword matches the title" do
      track = Track.new("Africa", "Toto")
      expect(track.matches?("Africa")).to eq true
    end

    it "returns true since the keyword matches the artist" do
      track = Track.new("Africa", "Toto")
      expect(track.matches?("Toto")).to eq true
    end

    it "returns true since the keyword matches both title & artist" do
      track = Track.new("Toto", "Toto")
      expect(track.matches?("Toto")).to eq true
    end

    it "returns true since the keyword doesn't match either title nor artist" do
      track = Track.new("Africa", "Toto")
      expect(track.matches?("Hold the line")).to eq false
    end

    it "returns true since the keyword is included in the title" do
      track = Track.new("Everything has changed", "Toto")
      expect(track.matches?("Everything")).to eq true
    end
    
    it "returns true since the keyword is included in the artist name" do
      track = Track.new("Everything has changed", "Ed Sheeran")
      expect(track.matches?("Sheeran")).to eq true
    end
  end
end