class GrammarStats
  def initialize
    @passed_texts = 0
    @checked_texts = 0
  end
  
  def check(text)
    # fail "not valid sentence" if text == ""
    if (text[0] == text[0].capitalize) && ([".", "!", "?"].include? text[-1])
      @passed_texts += 1
      @checked_texts += 1
      return true
    else
      @checked_texts += 1
      return false
    end
  end
  
  # Returns as an integer the percentage of texts checked so far that passed
  # the check defined in the `check` method. The number 55 represents 55%.
  
  def percentage_good
    return (@passed_texts.to_f / @checked_texts.to_f * 100).round
  end
end