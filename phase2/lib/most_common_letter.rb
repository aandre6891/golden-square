def get_most_common_letter(text)
  text_with_no_spaces = text.split(" ").join("")
  counter = Hash.new(0)
  text_with_no_spaces.chars.each do |char|
    counter[char] += 1
  end
  puts counter.to_a.sort_by { |k, v| -v }[0][0]
end

get_most_common_letter("the roof, the roof, the roof is on fire!")

# Intended output:
# 
# > get_most_common_letter("the roof, the roof, the roof is on fire!")
# => "o"