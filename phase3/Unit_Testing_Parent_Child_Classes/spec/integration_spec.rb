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
end