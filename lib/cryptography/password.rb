# encoding : UTF-8
module Tamatebako
  module Cryptography
    class Password

      def initialize(options)
        @chars = small_caps
        @chars += uppercase if options[:c]
        @chars += numbers if options[:n]
        @chars += special if options[:s]

        @length = options[:l].to_i
        @unique = options[:u]
      end

      def generate
        password = []

        until password.length == @length
          char = @chars[rand(@chars.size)]
          password << char if (@unique)? !password.include?(char) : true
        end

        password.join
      end

      private

      def small_caps
        ('a'..'z').to_a
      end

      def uppercase
        ('A'..'Z').to_a
      end

      def numbers
        ('0'..'9').to_a
      end

      def special
        ['@','#','&','é','(',')','§','è','!','ç','à','-','_','^','$','*','€','%','ù','£','+','/',':',';',',',
          ',','?','.','<','>','ë','{','¶','«','ø','}','|',']','Á','Û','»','å','[','Ÿ']
      end
    end
  end
end