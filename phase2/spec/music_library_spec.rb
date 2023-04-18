require "music_library"

RSpec.describe MusicLibrary do
  context "when we add a track" do
    it "adds that track to the library" do
      music_library = MusicLibrary.new
      track = Track.new("my_title", "my_artist")
      music_library.add(track)
      expect(music_library.all).to eq [track]
    end
  end
end