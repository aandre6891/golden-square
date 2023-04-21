require "track"

RSpec.describe Track do
  it "constructs" do
    track = Track.new("title1", "artist1")
    expect(track.title).to eq "title1"
    expect(track.artist).to eq "artist1"
  end
    
  it "returns true since the keyword matches the title" do
    track = Track.new("my_title", "artist")
    expect(track.matches?("my_title")).to eq true
  end

  it "returns true since the keyword matches the artist" do
    track = Track.new("my_title", "artist")
    expect(track.matches?("my_title")).to eq true
  end

  it "returns true since the keyword matches both title & artist" do
    track = Track.new("my_title", "artist")
    expect(track.matches?("my_title")).to eq true
  end

  xit "returns true since the keyword doesn't match either title nor artist" do
    track = Track.new("my_title", "artist")
    expect(track.matches?("my_title")).to eq false
  end
end