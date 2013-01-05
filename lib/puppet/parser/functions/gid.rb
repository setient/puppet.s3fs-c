module Puppet::Parser::Functions
  newfunction(:gid, :type => :rvalue) do |args|
    raise(Puppet::ParseError, "gid(): Wrong number of arguments given (#{args.size} instead of 1)") if args.size != 1
    `sed -nr \"s/^$args[0]:x:([0-9]+):.*/\1/p\" /etc/group`
  end
end