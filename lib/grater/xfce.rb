module Grater
  class Xfce

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
