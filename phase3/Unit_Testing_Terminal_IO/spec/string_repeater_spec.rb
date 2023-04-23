# string_repeater = StringRepeater.new(Kernel)
# string_repeater.run

require "string_repeater"

RSpec.describe StringRepeater do
  it "repeats the string 10 times" do
    terminal = double(:terminal)
    expect(terminal).to receive(:puts).with("Hello. I will repeat a string many times.").ordered
    expect(terminal).to receive(:puts).with("Please enter a string").ordered
    expect(terminal).to receive(:gets).and_return("TWIX").ordered
    expect(terminal).to receive(:puts).with("Please enter a number of repeats").ordered
    expect(terminal).to receive(:gets).and_return("10").ordered
    expect(terminal).to receive(:puts).with("Here is your result:").ordered
    expect(terminal).to receive(:puts).with("TWIXTWIXTWIXTWIXTWIXTWIXTWIXTWIXTWIXTWIX").ordered

    string_repeater = StringRepeater.new(terminal)
    string_repeater.repeater
  end

  it "it returns fail if number of repeats is not an integer" do
    terminal = double(:terminal)
    expect(terminal).to receive(:puts).with("Hello. I will repeat a string many times.").ordered
    expect(terminal).to receive(:puts).with("Please enter a string").ordered
    expect(terminal).to receive(:gets).and_return("TWIX").ordered
    expect(terminal).to receive(:puts).with("Please enter a number of repeats").ordered
    expect(terminal).to receive(:gets).and_return("a string instead of an integer").ordered

    string_repeater = StringRepeater.new(terminal)
    expect{ string_repeater.repeater }.to raise_error("not a valid number of repeats")
  end

  it "it returns fail if string is empty" do
    terminal = double(:terminal)
    expect(terminal).to receive(:puts).with("Hello. I will repeat a string many times.").ordered
    expect(terminal).to receive(:puts).with("Please enter a string").ordered
    expect(terminal).to receive(:gets).and_return("").ordered

    string_repeater = StringRepeater.new(terminal)
    expect{ string_repeater.repeater }.to raise_error("empty string not accepted")
  end

  it "it returns fail if no number of repeats is given" do
    terminal = double(:terminal)
    expect(terminal).to receive(:puts).with("Hello. I will repeat a string many times.").ordered
    expect(terminal).to receive(:puts).with("Please enter a string").ordered
    expect(terminal).to receive(:gets).and_return("TWIX").ordered
    expect(terminal).to receive(:puts).with("Please enter a number of repeats").ordered
    expect(terminal).to receive(:gets).and_return("").ordered

    string_repeater = StringRepeater.new(terminal)
    expect{ string_repeater.repeater }.to raise_error("number of repeats cannot be empty")
  end
end