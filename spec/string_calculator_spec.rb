require "spec_helper"
require_relative '../string_calculator'

RSpec.describe StringCalculator do
  describe "#add" do
    context 'with string calculator' do
      it "returns 0 for an empty string" do
        expect(StringCalculator.add("")).to eql(0)
      end

      it "returns the number for a single number string" do
        expect(StringCalculator.add("1")).to eql(1)
      end

      it "returns the sum for comma-separated numbers" do
        expect(StringCalculator.add("1,2,3")).to eql(6)
      end

      it "returns the sum for new line separated numbers" do
        expect(StringCalculator.add("1\n2\n3")).to eql(6)
      end

      it "returns the sum for numbers with custom delimiter" do
        expect(StringCalculator.add("//;\n1;2;3")).to eql(6)
      end

      it "raises an exception for negative numbers" do
        expect { StringCalculator.add("1,-2,3,-4") }.to raise_error("negative numbers not allowed -2,-4")
      end
    end
  end
end