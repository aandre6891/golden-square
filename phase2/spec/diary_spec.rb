#file: diary_spec.rb

require 'diary'

RSpec.describe "Dairy" do
    it'list is empty' do
        diary = Diary.new
        expect(diary.all).to eq []
    end
end