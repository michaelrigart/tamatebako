module Tamatebako
	module Cryptography
		module Base64
			module_function
			require 'base64'


			def encode(string)
				::Base64.encode64(string).gsub("\n", "")
			end

			def decode(string)
				::Base64.decode64(string)
			end
		end
	end
end
