require "diary_entry2"

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

  describe "#reading_time" do
    it "fails if the wpm is zero" do
      diary_entry = DiaryEntry.new("my_title", "hello world")
      expect{ diary_entry.reading_time(0) }.to raise_error "WPM must be positive"
    end

    it "returns zero if the content is empty" do
      diary_entry = DiaryEntry.new("my_title", "")
      expect(diary_entry.reading_time(2)).to eq 0
    end

    it "returns one if the content is one word" do
      diary_entry = DiaryEntry.new("my_title", "one")
      expect(diary_entry.reading_time(2)).to eq 1
    end

    it "returns a reading time for the contents" do
      diary_entry = DiaryEntry.new("my_title", "one two three four five")
      expect(diary_entry.reading_time(2)).to eq 3
    end
  end
end