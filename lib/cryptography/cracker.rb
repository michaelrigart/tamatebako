module Tamatebako
  module Cryptography
    module Cracker
      module_function

      def numbers(algorithm, hash)
        num = 0

        while hash != Tamatebako::Cryptography::Digest.hex(algorithm, num.to_s)
          num += 1
        end

        num
      end

      def dictionary(algorithm, dict, hash)
        dict = File.open(dict, "r")

        while word = dict.gets.strip
          break if Tamatebako::Cryptography::Digest.hex(algorithm, word) == hash
        end

        word
      end

      def online(algorithm, hash)
        require 'curb'
        require 'nokogiri'

        case algorithm
          when "md5"
            resource = "http://www.md5-lookup.com/index.php?q=#{hash}"
          when "sha1"
            resource = "http://www.sha1-lookup.com/index.php?q=#{hash}"
          when "sha256"
            resource = "http://sha-256.sha1-lookup.com/index.php?=#{hash}"
          when "ripemd160"
            resource = "http://www.ripemd-lookup.com/index.php?q=#{hash}"
        end

        http =  Curl::Easy.perform(resource)
        body = http.body_str

        doc = Nokogiri::HTML(body)
        doc.xpath('//div[@id="LSShadow"]//table/tr[position() = 5]/td[position() = 1]/text()')
      end
    end
  end
end