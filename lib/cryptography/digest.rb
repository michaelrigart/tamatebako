module Tamatebako
  module Cryptography
    module Digest
      module_function

      def hex(type, string)
        case type
          when "md5"
            require "digest/md5"
            ::Digest::MD5.hexdigest(string)
          when "sha1"
            require "digest/sha1"
            ::Digest::SHA1.hexdigest(string)
          when "sha256"
            require "digest/sha2"
            ::Digest::SHA256.hexdigest(string)
          when "sha384"
            require "digest/sha2"
            ::Digest::SHA384.hexdigest(string)
          when "sha512"
            require "digest/sha2"
            ::Digest::SHA512.hexdigest(string)
          when "rmd160"
            require "digest/rmd160"
            ::Digest::RMD160.hexdigest(string)
        end
      end
    end
  end
end
