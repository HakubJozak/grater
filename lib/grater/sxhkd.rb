module Grater
  module Sxhkd

    def write_hotkeys(commands)
      # change config file
      File.open(@keys_file,"w+") do |f|
        commands.each_pair do |_,cmd|
          f.write "#{cmd.to_sxhkd}\n"
        end
      end

      # trigger reload
      pid = `pgrep sxhkd`
      unless pid.empty?
        system "kill -s USR1 #{pid}"
      else
        puts "Looks like sxhkd is not running."
      end

    end    
  end
end
