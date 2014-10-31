module Tamatebako
  module Network
    module PortScanner
      require "socket"
      module_function

      def tcp_scan(host, range)
        range = range.split('-')
        range[1] = range[0] if range[1].empty?

        range[0].upto(range[1]) do |port|
          begin
            socket = TCPSocket.new(host, port)
            socket.close
            STDOUT << "#{port.to_s}/tcp\t\t#{Socket.getservbyport(port.to_i)}\n"
          rescue
          end
        end
      end

      def udp_scan(host, range)
        # UDP is stateless. Need to check for descent strategy
      end
    end
  end
end