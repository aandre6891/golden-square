require 'greet'

RSpec.describe "greet method" do
  it "should say 'hello' to Andy" do
    result = greet("Andy")
    expect(result).to eq "Hello, Andy!"
  end
end