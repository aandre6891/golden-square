require "secret_diary"

RSpec.describe SecretDiary do
  context "since initially the diary is off locked" do
    it "it doesn't read the diary" do
      diary = double :fake_diary, contents: "my fake content"
      secret_diary = SecretDiary.new(diary)
      expect{ secret_diary.read }.to raise_error "Go away!"
    end
  end

  context "when the diary is unlocked" do
    it "reads the diary content" do
      diary = double :diary, read: "my fake content"
      secret_diary = SecretDiary.new(diary)
      secret_diary.unlock
      expect(secret_diary.read).to eq "my fake content"
    end
  end

  context "when the diary is unlocked and locked again" do
    it "raise error" do
      diary = double :fake_diary
      secret_diary = SecretDiary.new(diary)
      secret_diary.unlock
      secret_diary.lock
      expect{ secret_diary.read }.to raise_error "Go away!"
    end
  end
end