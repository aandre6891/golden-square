require "interactive_calculator"

RSpec.describe InteractiveCalculator do
  it "substracts two numbers given by the user and receive a returns number" do
    terminal = double(:terminal)
    expect(terminal).to receive(:puts).with("Hello. I will subtract two numbers.").ordered
    expect(terminal).to receive(:puts).with("Please enter a number").ordered
    expect(terminal).to receive(:gets).and_return("5").ordered 
    expect(terminal).to receive(:puts).with("Please enter another number").ordered
    expect(terminal).to receive(:gets).and_return("4").ordered
    expect(terminal).to receive(:puts).with("Here is your result: ").ordered
    expect(terminal).to receive(:puts).with("5 - 4 = 1").ordered
    interactive_calculator = InteractiveCalculator.new(terminal)
    interactive_calculator.run    
  end

  it "substracts two equal numbers given by the user and and returns zero" do
    terminal = double(:terminal)
    expect(terminal).to receive(:puts).with("Hello. I will subtract two numbers.").ordered
    expect(terminal).to receive(:puts).with("Please enter a number").ordered
    expect(terminal).to receive(:gets).and_return("10").ordered 
    expect(terminal).to receive(:puts).with("Please enter another number").ordered
    expect(terminal).to receive(:gets).and_return("10").ordered
    expect(terminal).to receive(:puts).with("Here is your result: ").ordered
    expect(terminal).to receive(:puts).with("10 - 10 = 0").ordered
    interactive_calculator = InteractiveCalculator.new(terminal)
    interactive_calculator.run    
  end

  it "substracts two equal numbers given by the user and and returns a negative result" do
    terminal = double(:terminal)
    expect(terminal).to receive(:puts).with("Hello. I will subtract two numbers.").ordered
    expect(terminal).to receive(:puts).with("Please enter a number").ordered
    expect(terminal).to receive(:gets).and_return("5").ordered 
    expect(terminal).to receive(:puts).with("Please enter another number").ordered
    expect(terminal).to receive(:gets).and_return("10").ordered
    expect(terminal).to receive(:puts).with("Here is your result: ").ordered
    expect(terminal).to receive(:puts).with("5 - 10 = -5").ordered
    interactive_calculator = InteractiveCalculator.new(terminal)
    interactive_calculator.run    
  end

  it "it fails if given a string instead of the first number" do
    terminal = double(:terminal)
    expect(terminal).to receive(:puts).with("Hello. I will subtract two numbers.").ordered
    expect(terminal).to receive(:puts).with("Please enter a number").ordered
    expect(terminal).to receive(:gets).and_return("hello").ordered 
    
    interactive_calculator = InteractiveCalculator.new(terminal)
    expect { interactive_calculator.run }.to raise_error ("Not a valid number")    
  end
  
  it "it fails if given a string instead of the second number" do
    terminal = double(:terminal)
    expect(terminal).to receive(:puts).with("Hello. I will subtract two numbers.").ordered
    expect(terminal).to receive(:puts).with("Please enter a number").ordered
    expect(terminal).to receive(:gets).and_return("5").ordered 
    expect(terminal).to receive(:puts).with("Please enter another number").ordered
    expect(terminal).to receive(:gets).and_return("hello").ordered

    interactive_calculator = InteractiveCalculator.new(terminal)
    expect { interactive_calculator.run }.to raise_error ("Not a valid number")    
  end
end