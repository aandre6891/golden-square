#file: diary_integration_spec.rb

require 'diary'
require 'diary_entry'

RSpec.describe "Dairy Integration" do
    it'adds diary entries and retrives them' do
        diary = Diary.new
        entry_1 = DiaryEntry.new("Title 1", "This is the first entry.")
        entry_2 = DiaryEntry.new("Title 2", "This is the second entry.")
        diary.add(entry_1)
        diary.add(entry_2)
        expect(diary.all).to eq [entry_1, entry_2]
    end

    it 'counts total words in the diary' do
        diary = Diary.new
        entry_1 = DiaryEntry.new("Title 1", "This is the first entry.")
        entry_2 = DiaryEntry.new("Title 2", "This is the second entry.")
        diary.add(entry_1)
        diary.add(entry_2)
        expect(diary.count_words).to eq 10
    end
end