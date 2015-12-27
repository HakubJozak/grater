require_relative 'runner'

module Grater
  class GnomeShell
    include ::Grater::Runner

    BASE = "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings"

    def delete_all_shortcuts
      fetch_shortcuts.each do |key|
        reset_dir(key)
      end

      write_array BASE, []
    end

    def add_shortcut(key,cmd)
      list = fetch_shortcuts
      i = list.size
      root = "#{BASE}/custom#{i}/"
      list += [ root ]

      write_array BASE, list
      write_string "#{root}name", "Grate Shortcut #{i}"
      write_string "#{root}binding", key
      write_string "#{root}command", cmd
    end

    private

    def fetch_shortcuts
      read(BASE)      
    end

    def reset_dir(key)
      run("dconf reset -f #{key}")      
    end

    def write_array(property,value)
      if value.empty?
        run("dconf write #{property} '@as []'")
      else
        serialized = value.map { |key| "'#{key}'" }.join(',')
        run("dconf write #{property} \"[#{serialized}]\"")
      end
    end

    def write_string(property,value)
      run("dconf write #{property} \"'#{value}'\"")
    end

    def read(property)
      result = run("dconf read #{property}")
      # quick and dirty ... but it works :]
      if result == '@as []'
        []
      else
        eval result
      end
    end
  end
end
