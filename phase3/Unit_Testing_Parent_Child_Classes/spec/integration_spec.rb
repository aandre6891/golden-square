require "track"
require "music_library"

RSpec.describe "integration" do
  it "returns a list of all the tracks in the Library" do
    music_library = MusicLibrary.new
    track_1 = Track.new("my_title1", "artits_1")
    track_2 = Track.new("my_title2", "artist_2")
    music_library.add(track_1)
    music_library.add(track_2)
    expect(music_library.all).to eq [track_1, track_2]
  end

  context "when no track match the keyword" do 
    it "returns an empty list" do
      music_library = MusicLibrary.new
      track_1 = Track.new("Everything has changed", "Ed Sheeran")
      track_2 = Track.new("Africa", "Toto")
      track_3 = Track.new("A-team", "Ed Sheeran")
      music_library.add(track_1)
      music_library.add(track_2)
      music_library.add(track_3)
      expect(music_library.search("Queen")).to eq []
    end
  end

  it "returns a list of all the tracks in the Library that match a given title" do
    music_library = MusicLibrary.new
    track_1 = Track.new("Everything has changed", "Ed Sheeran")
    track_2 = Track.new("Everything has changed", "Keywest")
    track_3 = Track.new("Africa", "Toto")
    music_library.add(track_1)
    music_library.add(track_2)
    music_library.add(track_3)
    expect(music_library.search("Everything has changed")).to eq [track_1, track_2]
  end

  it "returns a list of all the tracks in the Library that match the artist" do
    music_library = MusicLibrary.new
    track_1 = Track.new("Everything has changed", "Ed Sheeran")
    track_2 = Track.new("Africa", "Toto")
    track_3 = Track.new("A-team", "Ed Sheeran")
    music_library.add(track_1)
    music_library.add(track_2)
    music_library.add(track_3)
    expect(music_library.search("Ed Sheeran")).to eq [track_1, track_3]
  end
end