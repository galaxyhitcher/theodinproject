class Cipher
	attr_accessor :string_to_decode, :shift
	def initialize string_to_decode, shift
		@string_to_decode = string_to_decode
		@shift = shift
	end

	def perform_shift
		@shift.times {
			@string_to_decode.split('').each_with_index do |letter, i|
				if letter == "z"
					@string_to_decode[i] = "a"
				elsif letter == "Z"
					@string_to_decode[i] = "A"
				else
					@string_to_decode[i] = letter.succ
				end
			end
		}
		@string_to_decode
	end
end

