require 'report_length'

RSpec.describe "Report length method" do
    it "should return 23 which is the length of the string of the test.'" do
        result = report_length('hello, my name is Andy.')
        expect(result).to eq("This string was 23 characters long.")
    end
end