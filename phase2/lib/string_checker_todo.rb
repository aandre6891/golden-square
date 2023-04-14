def string_checker_todo(string)
  fail "you haven't given a string" if string.is_a? Integer
  fail "no string found" if string.empty?
  (string.include? "#TODO") ? true : false
end