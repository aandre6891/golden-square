require "string_checker_todo"

RSpec.describe "string_checker_todo" do
  context "if no string is given" do
    it "return fail" do
      expect{ string_checker_todo("") }.to raise_error "no string found"
    end
  end
  context "if #TODO is the only word in the string" do
    it "returns true" do
      result = string_checker_todo("#TODO")
      expect(result).to eq true
    end
  end

  context "if #TODO is included in the string" do
    it "returns true" do
      result = string_checker_todo("hello, this is the first #TODO")
      expect(result).to eq true
    end
  end

  context "if the string include just the #" do
    it "returns false" do
      result = string_checker_todo("#")
      expect(result).to eq false
    end
  end

  context "if the string include just #TO" do
    it "returns false" do
      result = string_checker_todo("#TO")
      expect(result).to eq false
    end
  end

  context "if #todo (downcase) is the only word in the string" do
    it "returns false" do
      result = string_checker_todo("#todo")
      expect(result).to eq false
    end
  end

  context "if #todo (donwcase) is included in the string" do
    it "returns false" do
      result = string_checker_todo("hello, this is the first #todo")
      expect(result).to eq false
    end
  end

  context "if the given argument is an integer" do
    it "fail" do
      expect{ string_checker_todo(1) }.to raise_error "you haven't given a string"
    end
  end
end