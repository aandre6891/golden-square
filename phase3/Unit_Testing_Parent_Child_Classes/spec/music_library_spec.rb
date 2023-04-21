require "music_library"

RSpec.describe MusicLibrary do
  context "initially" do
    it "returns an empty list" do
      music_library = MusicLibrary.new
      expect(music_library.all).to eq []
    end
  end
end