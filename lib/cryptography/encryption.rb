module Tamatebako
  module Cryptography
    module Encryption
      module_function

      def encrypt(type, string)
        case type
          when "bcrypt"
            require 'bcrypt'
            BCrypt::Password.create(string)
        end
      end
    end
  end
end