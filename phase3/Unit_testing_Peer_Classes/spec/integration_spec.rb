require "diary"
require "secret_diary"

RSpec.describe "Integration" do
  context "initially, since the diary is locked" do
    it "raise an error" do
      diary = Diary.new("my example text")
      secret_diary = SecretDiary.new(diary)
      expect{ secret_diary.read }.to raise_error "Go away!"
    end
  end
  
  context "when the diary is unloked" do
    it "reads the diary content" do
      diary = Diary.new("my example text")
      secret_diary = SecretDiary.new(diary)
      secret_diary.unlock
      expect(secret_diary.read).to eq "my example text"
    end
  end

  context "when the diary is unlocked and locked again" do
    it "raise an error" do
      diary = Diary.new("my example text")
      secret_diary = SecretDiary.new(diary)
      secret_diary.unlock
      secret_diary.lock
      expect{ secret_diary.read }.to raise_error "Go away!"
    end
  end
end

