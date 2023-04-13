def count_words(string)
  fail "no string found" if string.nil?
  number_of_words = string.split(" ").count
  number_of_words
end