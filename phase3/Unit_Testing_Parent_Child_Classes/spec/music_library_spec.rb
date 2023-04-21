require "music_library"

RSpec.describe MusicLibrary do
  context "initially" do
    it "returns an empty list" do
      music_library = MusicLibrary.new
      expect(music_library.all).to eq []
    end
  end

  context "when we add 2 tracks" do
    it "returns the list of tracks in the music library" do
      music_library = MusicLibrary.new
      track_1 = double :FakeTrack, title: "title_1", artist: "artist_1"
      track_2 = double :FakeTrack, title: "title_2", artist: "artist_2"
      music_library.add(track_1)
      music_library.add(track_2)
      expect(music_library.all).to eq [track_1, track_2]
    end
  end
  
  describe "#search" do
    it "returns track_1 since it matches the keyword" do
      music_library = MusicLibrary.new
      track_1 = double :FakeTrack, matches?: true
      track_2 = double :FakeTrack, matches?: false
      music_library.add(track_1)
      music_library.add(track_2)
      expect(music_library.search("title_1")).to eq [track_1]
    end

    it "returns a list of tracks since more tracks match the keyword" do
      music_library = MusicLibrary.new
      track_1 = double :FakeTrack, matches?: true
      track_2 = double :FakeTrack, matches?: false
      track_3 = double :FakeTrack, matches?: false
      track_4 = double :FakeTrack, matches?: true
      music_library.add(track_1)
      music_library.add(track_2)
      music_library.add(track_3)
      music_library.add(track_4)
      expect(music_library.search("title_1")).to eq [track_1, track_4]
    end
  end
end