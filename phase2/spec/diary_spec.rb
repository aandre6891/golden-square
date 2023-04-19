#file: diary_spec.rb

require 'diary'

RSpec.describe "Dairy" do
	context "initially" do
		it'list is empty' do
			diary = Diary.new
			expect(diary.all).to eq []
		end

		it "has a word count of 0" do
			diary = Diary.new
			expect(diary.count_words).to eq 0
		end
	end
end