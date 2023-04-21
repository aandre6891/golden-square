require "diary"

RSpec.describe Diary do
  context "at creation" do
    it "returns an empty array" do
      diary = Diary.new
      expect(diary.entries).to be_empty
    end
  end
end