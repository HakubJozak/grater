module Grater
  class NativeCommand
    include Grater::Runner
    attr_reader :pattern

    def initialize(command,keys)
      @keys = keys
      @command = command
    end

    def to_sxhkd
<<-EOF
#{@keys}
  #{@command}
EOF
    end
  end
end
