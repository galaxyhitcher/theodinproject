class Cipher
	attr_accessor :string_to_decode, :shift
	def initialize string_to_decode, shift
		@string_to_decode = string_to_decode
		@shift = shift
	end

	def perform_shift
		decode = @string_to_decode.dup
		@shift.times {
			decode.split('').each_with_index do |letter, i|
				if letter == "z"
					decode[i] = "a"
				elsif letter == "Z"
					decode[i] = "A"
				else
					decode[i] = letter.succ
				end
			end
		}
		decode
	end
end

