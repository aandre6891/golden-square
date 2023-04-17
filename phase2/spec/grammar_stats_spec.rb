require "grammar_stats"

describe GrammarStats do 
  describe "#check" do
    context "given a text that starts with a capital letter and ends with an appropriate punctuation" do
      it "returns true" do
        grammar_stats = GrammarStats.new
        expect(grammar_stats.check("Hello we are Aubrey and Andrea.")).to eq true
      end
    end

    context "given a text that starts with a capital letter and ends without an appropriate punctuation mark" do
      it "returns false" do
        grammar_stats = GrammarStats.new
        expect(grammar_stats.check("Hello we are Aubrey and Andrea")).to eq false
      end
    end
  end

    # context "given an empty string" do
    #   it "fails" do
    #     grammar_stats = GrammarStats.new
    #     expect { grammar_stats.check("") }.to raise_error "not valid sentence"
    #   end
    # end

  describe "#percentage_good" do
    context "given three strings, one valid and two not" do
      it "returns 33" do
        grammar_stats = GrammarStats.new
        grammar_stats.check("Valid string!")
        grammar_stats.check("invalid string!")
        grammar_stats.check("invalid string2?")
        expect(grammar_stats.percentage_good).to eq 33
      end
    end
  end
end