require "diary"
require "diary_entry"
require "diary_reader"

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
  end

# # 3 - when it does not fit exactly the given time
# diary = Diary.new
# diary_reader = DiaryReader.new(2, diary)
# diary_entry_1 = DiaryEntry.new("title1", "one")
# diary_entry_2 = DiaryEntry.new("title2", "one two")
# diary_entry_3 = DiaryEntry.new("title3", "one two three")
# diary_entry_4 = DiaryEntry.new("title4", "one two three four five")
# diary.add(diary_entry_1)
# diary.add(diary_entry_2)
# diary.add(diary_entry_3)  
# diary.add(diary_entry_4)
# expect(diary_reader.find_most_readable_in_time(2)).to eq diary_entry_3

# # 4 - when there is nothing readable in the given time
# diary = Diary.new
# diary_reader = DiaryReader.new(2, diary)
# diary_entry_1 = DiaryEntry.new("title1", "one two three four five")
# diary.add(diary_entry_4 )
# expect(diary_reader.find_most_readable_in_time(2)).to eq nil

# # 5 - nothing to read at all
# diary = Diary.new
# diary_reader = DiaryReader.new(0, diary)
# expect { diary_reader.find_most_readable_in_time(2) }.to raise_error "wpm should be positive"

# # 6 - wpm is zero
# diary = Diary.new
# diary_reader = DiaryReader.new(2, diary)
# expect(diary_reader.find_most_readable_in_time(2)).to eq nil


# # 7
# task_list = TaskList.new
# task_1 = Task.new("walk the dog")
# task_2 = Task.new("eat the food")
# task_list.add(task_1)
# task_list.add(task_2)
# expect(task_list.all).to eq [task_1, task_2] 


# # 8
# diary = Diary.new
# diary_entry_1 = DiaryEntry.new("title1", "my friend's number is 123456789")
# diary_entry_2 = DiaryEntry.new("title2", "my friend's numbers are 123456789, 987654321. 918273645 and 918273645")
# diary.add(diary_entry_1)
# diary.add(diary_entry_ 2)
# phone_book = PhoneNumberCrawler.new(diary)
# result = phone_book.extract_numbers
# expect(result)).to eq ["123456789", "987654321", "918273645"]

end