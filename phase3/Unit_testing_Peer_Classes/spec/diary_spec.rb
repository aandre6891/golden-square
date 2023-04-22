require "diary"

RSpec.describe Diary do
  it "constructs" do
    diary = Diary.new("Test content")
    expect(diary.read).to eq("Test content")
  end
end