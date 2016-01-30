module Grater
  module DSL
    class Root
      attr_reader :commands

      def self.read(filename)
        f = File.new(filename).read
        dsl = Grater::DSL::Root.new
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

    class Handler
      include Grater::Runner

      def activate(*args)
        if args.length == 2
          pattern, exec = args
        else
          opts = args.first
          pattern, exec = web_app_props(opts[:web_app])
        end

        do_or_run :activate, pattern, exec
      end

      def summon(pattern,exec)
        do_or_run(:summon,pattern,exec)
      end

      private

      def do_or_run(action,pattern,exec)
        if w = Grater::Window.find(pattern)
          w.send(action)
        else
          system(exec)
        end
      end

      def web_app_props(app_id)
        pattern = /#{app_id}.google-chrome/
        exec = "/opt/google/chrome/google-chrome --profile-directory=Default --app-id=#{app_id}"
        [ pattern, exec]
      end
    end
  end
end
