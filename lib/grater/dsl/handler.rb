require 'grater/runner'
require 'singleton'

module Grater
  module Dsl
    class Handler
      include Grater::Runner
      include Singleton

      def initialize
        @marks = {}
      end

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
