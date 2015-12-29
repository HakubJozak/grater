module Grater
  module DSL
    class Root
      attr_reader :commands
      
      def self.read(filename)
        f = File.new(filename).read
        dsl = Grater::DSL::Root.new
        dsl.instance_eval(f)
        puts dsl.commands.inspect
        dsl.commands
      end

      def initialize
        @commands = {}
      end

      def method_missing(name, *args, &block)
        @commands[name.to_s] =
          Grater::Command.new(name,args.first,&block)
      end
    end

    class Handler
      def summon(pattern,exec)
        Grater::Window.summon_or_run(pattern,exec)
      end

      def summon_web_app(app_id)
        pattern = /#{app_id}.google-chrome/
        cmd = "/opt/google/chrome/google-chrome --profile-directory=Default --app-id=#{app_id}"
        Grater::Window.summon_or_run(pattern,cmd)
      end
    end
  end
end
