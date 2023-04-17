

RSpec.describe "grammar stats class" do
  context "given a text that starts with capital letter and end with punctuation mark" do
    it "returns true" do
      grammar_stats = GrammarStats.new("Ciao, my name is Andy.")
      result = grammar_stats.check
      expect(result).to eq true
    end
  end
end