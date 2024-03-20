#!/usr/bin/env /usr/bin/ruby

require 'socket'
require 'fcntl'

STDERR.puts "init"

sin = Socket.for_fd(STDIN.fileno)
loop do
  s, _ = sin.accept()
  STDERR.puts "connection accepted"
  flags = s.fcntl(Fcntl::F_GETFL)
  s.fcntl(Fcntl::F_SETFL, flags & ~Fcntl::O_NONBLOCK)
  loop do
    data = s.recv(1024)
    if data.length == 0 then
        break
    end

    STDERR.puts data
    s.send(data + "oooo", 0)
  end
  s.close()
end
