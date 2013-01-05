module Puppet::Parser::Functions
  newfunction(:gid, :type => :rvalue) do |args|
    raise(Puppet::ParseError, "gid(): Wrong number of arguments given (#{args.size} instead of 1)") if args.size != 1
    `grep ^#{args[0]}: /etc/group | cut -d: -f3`.chomp
  end
end