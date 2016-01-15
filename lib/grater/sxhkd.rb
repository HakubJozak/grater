module Grater
  module Sxhkd

    def stop_key_listener
      system "kill -9 #{pid}"
    end

    def start_key_listener
      system "sxhkd &"
    end

    def reload_key_listener
      system "kill -s USR1 #{pid}"      
    end

    def pid
      `pgrep sxhkd`
    end
    
    def write_hotkeys(commands)
      # change config file

      # TODO get from @keys_file
      require 'fileutils'
      FileUtils.mkdir_p('/home/jakub/.config/sxhkd')

      File.open(@keys_file,"w+") do |f|
        commands.each_pair do |_,cmd|
          f.write "#{cmd.to_sxhkd}\n"
        end
      end

      unless pid.empty?
        reload_key_listener
      else
        puts "Looks like sxhkd is not running. Launching..."
        start_key_listener
      end

    end
  end
end
