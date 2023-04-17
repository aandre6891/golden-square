class DiaryEntry
  def initialize(title, contents) # title, contents are strings
    @title = title
    @contents = contents
  end

  def title
    return @title
  end

  def contents
    return @contents
  end

  def count_words
    return words.length
  end

  def reading_time(wpm) 
    fail "Reading speed must be above zero" if wpm == 0
    return (count_words / wpm.to_f).ceil
  end

  def reading_chunk(wpm, minutes) 
    words_we_can_read = wpm * minutes
    word_list = words[0, words_we_can_read]
    return word_list.join(" ")
  end

  private

  def words
   return @contents.split(" ")
  end
end