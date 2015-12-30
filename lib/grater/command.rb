module Grater
  class Command
    attr_reader :pattern

    def initialize(name,keys,&handler)
      @name = name
      @keys = keys
      @handler = handler
    end

    def run
      Grater::DSL::Handler.new.instance_eval(&@handler)
    end

    def to_sxhkd
<<-EOF
# #{@name}
#{@keys}
  /home/jakub/code/my/grater/bin/grater #{@name}
EOF
    end

    # not used
    def to_xbindkeysrc
<<-EOF
\"/home/jakub/code/my/grater/bin/grater #{@name}\"
  #{@keys}
EOF
    end
  end
end

