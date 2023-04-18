require "music_library"

RSpec.describe "integration" do
  context "when we add a track to the library" do
    it "comes back to the list" do
      music_library = MusicLibrary.new
      track = Track.new("my_title", "my_artist")
      music_library.add(track)
      expect(music_library.all).to eq [track]
    end
  end
end