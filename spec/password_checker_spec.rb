# true if password > 8
# true if password == 8
# fail if password < 8

require "password_checker.rb"

RSpec.describe "password checker" do
  context "returns true for password > 8 characters" do
    it "returns true" do
      password = PasswordChecker.new
      expect(password.check("123456789")).to eq(true)
    end
  end
  context "returns true for password == 8 characters" do
   it "returns true" do
      password = PasswordChecker.new
      expect(password.check("12345678")).to eq(true)
    end
  end
  context "returns a fail message if password < 8 characters" do
    it "returns 'Invalid password, must be 8+ characters.'" do
    password = PasswordChecker.new
    expect{ password.check("1234567") }.to raise_error "Invalid password, must be 8+ characters."
    end
  end
end