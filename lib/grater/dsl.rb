module Grater
  module Dsl
    class Root
      attr_reader :commands

      def self.read(filename)
        f = File.new(filename).read
        dsl = Grater::Dsl::Root.new
        dsl.instance_eval(f)
        dsl.commands
      end

      def initialize
        @commands = {}
        @count = 0
      end

      private

      def method_missing(name, *args, &block)
        hotkey = args.shift
        add_command(name, hotkey, args, block)
      end

      def add_command(name, hotkey, args, block)
        if name == :bind
          @count += 1
          # HACK
          @commands["bind#{@count}"] =
            Grater::NativeCommand.new(args.first,hotkey)
        else
          @commands[name.to_s] =
            Grater::Command.new(name,hotkey,&block)
        end
      end
    end
  end
end
