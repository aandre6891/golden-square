require "secret_diary"

RSpec.describe SecretDiary do
  it "constructs" do
    diary = double :fake_diary, contents: "my fake content"
    secret_diary = SecretDiary.new(diary)
    expect(secret_diary.read).to eq (diary)
  end
end