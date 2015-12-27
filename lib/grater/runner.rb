module Grater
  module Runner

    private

    def wmctrl(switches)
      run "wmctrl -i #{switches}"
      self
    end

    def run(cmd)
      puts ">> #{cmd}"
      `#{cmd}`.strip
    end

  end
end
