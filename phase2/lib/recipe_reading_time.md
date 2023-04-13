1. Describe the Problem

# As a user
# So that I can manage my time
# I want to see an estimate of reading time for a text, assuming that I can read 200 words a minute.

2. Design the Method Signature

reading_time = calculate_reading_time(text)

# text is a string of words
# reding_time is an integer that represents minutes

3. Create Examples as Tests

# 1
calculate_reading_time("")
# => 0

# 2
calculate_reading_time("one")
# => 1

# 3
calculate_reading_time("two hundred words")
# => 1

# 4
calculate_reading_time("three hundred words")
# => 2

# 5
calculate_reading_time("four hundred words")
# => 2

# 5
calculate_reading_time("five thousend words")
# => 25

