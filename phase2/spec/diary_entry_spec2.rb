require "diary_entry"

RSpec.describe DiaryEntry do
  it "constructs" do
    diary_entry = DiaryEntry.new("my_title", "this is an entry")
    expect(diary_entry.title).to eq "my_title"
    expect(diary_entry.contents).to eq "this is an entry"
  end

  describe "#count_words" do
    it "returns zero if the content is empty" do
      diary_entry = DiaryEntry.new("my_title", "")
      expect(diary_entry.count_words).to eq 0
    end

    it "returns one if the content is one word" do
      diary_entry = DiaryEntry.new("my_title", "one")
      expect(diary_entry.count_words).to eq 1
    end

    it "returns the number of words of the content" do
      diary_entry = DiaryEntry.new("my_title", "one two three")
      expect(diary_entry.count_words).to eq 3
    end
  end
end