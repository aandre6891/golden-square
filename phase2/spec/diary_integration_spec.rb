#file: diary_integration_spec.rb

require 'diary'
require 'diary_entry2'

RSpec.describe "Dairy Integration" do
	it'adds diary entries and retrives them' do
		diary = Diary.new
		entry_1 = DiaryEntry.new("Title 1", "This is the first entry.")
		entry_2 = DiaryEntry.new("Title 2", "This is the second entry.")
		diary.add(entry_1)
		diary.add(entry_2)
		expect(diary.all).to eq [entry_1, entry_2]
  end

	describe "word counting behaviour" do
		it 'counts total words in all the diary entries' do
			diary = Diary.new
			entry_1 = DiaryEntry.new("Title 1", "This is the first entry.")
			entry_2 = DiaryEntry.new("Title 2", "This is the second entry.")
			diary.add(entry_1)
			diary.add(entry_2)
			expect(diary.count_words).to eq 10
		end
	end

	describe "reading time behaviour" do
		it "fails where wpm is 0" do
			diary = Diary.new
			diary_entry_1 = DiaryEntry.new("my title", "my content")
			diary.add(diary_entry_1)
			expect { diary.reading_time(0) }.to raise_error "WPM must be positive"
		end 

		it "calculates the reading time for all entries where it fits exactly" do
			diary = Diary.new
			diary_entry_1 = DiaryEntry.new("my title", "my content 1")
			diary_entry_2 = DiaryEntry.new("my title 2", "my content 2")
			diary.add(diary_entry_1)
			diary.add(diary_entry_2)
			expect(diary.reading_time(2)).to eq 3
		end

		it "calculates the reading time for all entries where it falls over a minute" do
			diary = Diary.new
			diary_entry_1 = DiaryEntry.new("my title", "my content")
			diary_entry_2 = DiaryEntry.new("my title 2", "my content 2")
			diary.add(diary_entry_1)
			diary.add(diary_entry_2)
			expect(diary.reading_time(2)).to eq 3
		end
	end

	describe "best reading time entry behaviour" do
		it "fails where wpm is 0" do
			diary = Diary.new
			diary_entry_1 = DiaryEntry.new("my title", "my content")
			diary.add(diary_entry_1)
			expect { diary.find_best_entry_for_reading_time(0, 1) }.to raise_error "WPM must be positive"
		end

		context "where we just have one entry and it is readable in the time" do
			it "returns that entry" do
				diary = Diary.new
				diary_entry_1 = DiaryEntry.new("my title", "my content")
				diary.add(diary_entry_1)
				result = diary.find_best_entry_for_reading_time(2, 1)
				expect(result).to eq diary_entry_1
			end
		end

		context "where we just have one entry and it is readable in the time" do
			it "returns nill" do
				diary = Diary.new
				diary_entry_1 = DiaryEntry.new("my title", "my content longer")
				diary.add(diary_entry_1)
				result = diary.find_best_entry_for_reading_time(2, 1)
				expect(result).to eq nil
			end
		end

		context "where we have multiple entries" do
			it "returns the longest entry the user could read in this time" do
				diary = Diary.new
				best_entry = DiaryEntry.new("my title", "one two")
				diary.add(DiaryEntry.new("my title", "one"))
				diary.add(best_entry)
				diary.add(DiaryEntry.new("my title", "one two three"))
				diary.add(DiaryEntry.new("my title", "one two three four"))
				result = diary.find_best_entry_for_reading_time(2, 1)
				expect(result).to eq best_entry
			end
		end
	end
end