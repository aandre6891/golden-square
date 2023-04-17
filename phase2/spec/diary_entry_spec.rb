require "diary_entry"

RSpec.describe "diary entry class" do
  describe "#title && #contents" do
    it "constructs" do
      diary_entry = DiaryEntry.new("my_title", "my_contents")
      expect(diary_entry.title).to eq "my_title"
      expect(diary_entry.contents).to eq "my_contents"
    end
  end

  describe "#count_words" do
    it "returns the number of words in the contents" do
      diary_entry = DiaryEntry.new("my_title", "some contents here")
      expect(diary_entry.count_words).to eq 3
    end
  end

  context "if the contents is empty" do
    it "returns zero" do
      diary_entry = DiaryEntry.new("my_title", "")
      expect(diary_entry.count_words).to eq 0
    end
  end

  describe "#reading_time" do
    context "given a wpm of some sensible number (200)" do
      it "returns the ceiling of the number of minutes it takes to read the contents" do
        diary_entry = DiaryEntry.new("my_title", "one " * 550)
        expect(diary_entry.reading_time(200)).to eq 3
      end
    end
  end

  context "given a wpm of 0" do
    it "fails" do
      diary_entry = DiaryEntry.new("my_title", "one two three")
      expect { diary_entry.reading_time(0) }.to raise_error "Reading speed must be above zero"
    end
  end

  describe "#reading_chunk" do
    context "with a text readable within the given minutes" do
      it "returns the full contents" do
        diary_entry = DiaryEntry.new("my_title", "one two three")
        chunk = diary_entry.reading_chunk(200, 1)
        expect(chunk).to eq "one two three"
      end
    end
  end

  context "with a contents unreadable within the time" do
    it "returns a readable chung" do
      diary_entry = DiaryEntry.new("my_title", "one two three")
      chunk = diary_entry.reading_chunk(2, 1)
      expect(chunk).to eq "one two"
    end
  end
end