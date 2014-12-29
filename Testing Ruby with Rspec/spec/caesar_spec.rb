#TODO: somehow test that @string_to_decode variable is not modified by any methods after #initialize
require 'spec_helper'

describe Cipher do
	attr_accessor :string_to_decode, :shift

	before :each do
		@cipher = Cipher.new "string_to_decode", "shift"
	end

	describe "#new" do
		it "returns a new Cipher object" do 
			@cipher.should be_an_instance_of Cipher
		end
	end

	describe "#perform_shift" do
		it "shifts the string by the rules of the Caesar Cipher" do
			cipher = Cipher.new "HAL", 1
			cipher.perform_shift.should == "IBM"
		end

		it "shifts the string by the rules of the Caesar Cipher" do
			cipher = Cipher.new "taz", 1
			cipher.perform_shift.should == "uba"
		end

		it "shifts the string by the rules of the Caesar Cipher" do
			cipher = Cipher.new "WoZ", 1
			cipher.perform_shift.should == "XpA"
		end

		it "shifts the string by the rules of the Caesar Cipher" do
			cipher = Cipher.new "WoZ", 3
			cipher.perform_shift.should == "ZrC"
		end

		it "shifts the string backwards with a negative integer" do
			cipher = Cipher.new "dbst", -1
			cipher.perform_shift.should == "cars"
		end
	end
end