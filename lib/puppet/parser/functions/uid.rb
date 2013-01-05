module Puppet::Parser::Functions
  newfunction(:uid, :type => :rvalue) do |args|
    raise(Puppet::ParseError, "uid(): Wrong number of arguments given (#{args.size} instead of 1)") if args.size != 1
    `id -u $args[0]`
  end
end