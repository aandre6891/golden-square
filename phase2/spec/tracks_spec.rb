require "tracks"

RSpec.describe TrackList do
  context "trying to show an empty list" do
    xit "fails" do
      track_list = TrackList.new
      expect{ track_list.list }.to raise_error "the list is empty"
    end
  end

  context "adding a new track to the list and then showing the list" do
    xit "returns the list with one track" do
      track_list = TrackList.new
      track_list.add("Uptown Funk")
      expect(track_list.list).to eq ["Uptown Funk"]
    end
  end

  context "adding a new track to the list and then showing the list" do
    xit "returns the list with one track" do
      track_list = TrackList.new
      track_list.add("Uptown Funk")
      track_list.add("Paradise City")
      expect(track_list.list).to eq ["Uptown Funk", "Paradise City"]
    end
  end
end