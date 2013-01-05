module Puppet::Parser::Functions

  newfunction(:uid, :type => :rvalue) do |args|
    raise(Puppet::ParseError, "uid(): Wrong number of arguments given (#{args.size} instead of 1)") if args.size != 1
    system("id -u $args[0]").chomp
  end

  newfunction(:gid, :type => :rvalue) do |args|
    raise(Puppet::ParseError, "gid(): Wrong number of arguments given (#{args.size} instead of 1)") if args.size != 1
    system("sed -nr \"s/^$args[0]:x:([0-9]+):.*/\1/p\" /etc/group").chomp
  end

end