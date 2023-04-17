require "diary_entry"

RSpec.describe "diary entry class" do
  it "constructs" do
    diary_entry = DiaryEntry.new("my_title", "my_contents")
    expect(diary_entry.title).to eq "my_title"
  end
end