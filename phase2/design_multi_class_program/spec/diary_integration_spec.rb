require "diary"
require "diary_entry"
require "diary_reader"
require "phone_number_crawler"

RSpec.describe "diary integration" do
  context "given more DiaryEntries" do
    it "returns the list of entries of the Diary" do
      diary = Diary.new
      diary_entry_1 = DiaryEntry.new("Book", "I read a book yesterday")
      diary_entry_2 = DiaryEntry.new("Movie", "I watched a movie today")
      diary.add(diary_entry_1)
      diary.add(diary_entry_2)
      expect(diary.entries).to eq [diary_entry_1, diary_entry_2]
    end
  end

  describe "#diary_rading behaviour" do
    context "when there is a entry that fits exactly the given time" do
      it "returns that entry" do
        diary = Diary.new
        diary_reader = DiaryReader.new(2, diary)
        diary_entry_1 = DiaryEntry.new("title1", "one")
        diary_entry_2 = DiaryEntry.new("title2", "one two")
        diary_entry_3 = DiaryEntry.new("title3", "one two three")
        diary_entry_4 = DiaryEntry.new("title4", "one two three four")
        diary_entry_5 = DiaryEntry.new("title5", "one two three four five")
        diary.add(diary_entry_1)
        diary.add(diary_entry_2)
        diary.add(diary_entry_3) 
        diary.add(diary_entry_4)
        diary.add(diary_entry_5)
        expect(diary_reader.find_most_readable_in_time(2)).to eq diary_entry_4
      end
    end
    
    context "when there is a entry that doesn't fit exactly the given time" do
      it "returns that entry" do    
        diary = Diary.new
        diary_reader = DiaryReader.new(2, diary)
        diary_entry_1 = DiaryEntry.new("title1", "one")
        diary_entry_2 = DiaryEntry.new("title2", "one two")
        diary_entry_3 = DiaryEntry.new("title3", "one two three")
        diary_entry_4 = DiaryEntry.new("title4", "one two three four five")
        diary.add(diary_entry_1)
        diary.add(diary_entry_2)
        diary.add(diary_entry_3)  
        diary.add(diary_entry_4)
        expect(diary_reader.find_most_readable_in_time(2)).to eq diary_entry_3
      end
    end
    
    context "when there is nothing readable in the given time" do
      it "returns nil" do
        diary = Diary.new
        diary_reader = DiaryReader.new(2, diary)
        diary_entry_1 = DiaryEntry.new("title1", "one two three four five")
        diary.add(diary_entry_1)
        expect(diary_reader.find_most_readable_in_time(2)).to eq nil
      end
    end
    
    context "when there is nothing at all in the Diary" do
      it "should return nil" do
        diary = Diary.new
        diary_reader = DiaryReader.new(2, diary)
        expect(diary_reader.find_most_readable_in_time(2)).to eq nil
      end
    end
    
    context "when wpm is not valid" do
      it "should fail" do
        diary = Diary.new
        diary_reader = DiaryReader.new(0, diary)
        expect { diary_reader.find_most_readable_in_time(2) }.to raise_error "wpm should be positive"
      end
    end
  end
    
  describe "phone number extraction behaviour" do
    it "extracts the numbers from all the  diary entries" do
      diary = Diary.new
      phone_book = PhoneNumberCrawler.new(diary)
      diary_entry_0 = DiaryEntry.new("title0", "my friend is cool")
      diary_entry_1 = DiaryEntry.new("title1", "my friend's number is 07800000000")
      diary_entry_2 = DiaryEntry.new("title2", "my friend's numbers are 07800000000, 07800000001. 07800000002 and 07800000002")
      diary.add(diary_entry_0)
      diary.add(diary_entry_1)
      diary.add(diary_entry_2)
      result = phone_book.extract_numbers
      expect(result).to eq ["07800000000", "07800000001", "07800000002"]
    end
    
    it "doesn't extract invalid numbers" do
      diary = Diary.new
      phone_book = PhoneNumberCrawler.new(diary)
      diary_entry_3 = DiaryEntry.new("title3", "my friend's number is 0780000000, 10780000000, 07800001")
      diary.add(diary_entry_3)
      result = phone_book.extract_numbers
      expect(result).to eq []
    end
  end
end