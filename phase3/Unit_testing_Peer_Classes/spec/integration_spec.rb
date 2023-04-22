require "diary"
require "secret_diary"

RSpec.describe "Integration" do
  it "initially returns the content as the diary starts off locked" do
    diary = Diary.new("my example text")
    secret_diary = SecretDiary.new(diary)
    expect(diary.secret_read).to eq("my example text")
  end
end

