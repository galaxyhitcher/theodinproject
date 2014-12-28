require 'spec_helper'

describe Cipher do
	before :each do
		Cipher = Cipher.new "string_to_decode", "shift"
	end
end