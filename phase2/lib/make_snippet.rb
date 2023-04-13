def make_snippet(string)
  words = string.split(" ")
  if words.count <= 5
    string
  else words.count > 6
    first_five_words = words[0,5].join(" ")
    first_five_words + "..."
  end 
end