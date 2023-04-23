# Hello. I will repeat a string many times.
# Please enter a string
# TWIX
# Please enter a number of repeats
# 10
# Here is your result:
# TWIXTWIXTWIXTWIXTWIXTWIXTWIXTWIXTWIXTWIX

class StringRepeater
  def initialize(terminal)
    @terminal = terminal
  end

  def repeater
    @terminal.puts "Hello. I will repeat a string many times."
    @terminal.puts "Please enter a string"
    string = @terminal.gets
    @terminal.puts "Please enter a number of repeats"
    number_of_repeats = get_number_of_repeats
    @terminal.puts "Here is your result:"
    @terminal.puts "#{string * 10}"
  end

  def get_number_of_repeats
    user_input = @terminal.gets
    fail "not a valid number of repeats" unless user_input == user_input.to_i.to_s
    return user_input.to_i
  end
end