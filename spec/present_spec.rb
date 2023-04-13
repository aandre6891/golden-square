require 'present'

RSpec.describe Present do
	it "wraps and unwrap a value" do
		present = Present.new
		present.wrap(10)
		expect(present.unwrap).to eq(10)
	end

		it "fails if we unwrap without wrapping first " do
			present = Present.new
			expect { present.unwrap }.to raise_error "No contents have been wrapped."
		end

		it "fails if we wrap but we have already wrapped" do
			present = Present.new
			present.wrap(10)
			expect { present.wrap(5) }.to raise_error "A contents has already been wrapped."
		end

end