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

    def xfconf_query(args)

    end

    def set_shortcut(key,cmd)
      xfconf = Proc.new { |args|
        run "xfconf-query --channel xfce4-keyboard-shortcuts #{args}" \
            " --property '/commands/custom/#{key}' #{args}"
      }
      xfconf.call "--reset "      
      xfconf.call "--create --type string --set '#{cmd}'"
    end
    
  end
end
