require_relative 'dconf'

module Grater
  class GnomeShell
    include ::Grater::Dconf

    BASE = "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings"

    def delete_all_shortcuts
      fetch_shortcuts.each do |key|
        reset_dconf_dir(key)
      end

      write_dconf_array BASE, []
    end

    def add_shortcut(key,cmd)
      list = fetch_shortcuts
      i = list.size
      root = "#{BASE}/custom#{i}/"
      list += [ root ]

      write_dconf_array BASE, list
      write_dconf_string "#{root}name", "Grate Shortcut #{i}"
      write_dconf_string "#{root}binding", key
      write_dconf_string "#{root}command", cmd

      puts "'#{cmd}' bound to '#{key}'"
    end

    private

    def fetch_shortcuts
      read_dconf(BASE)      
    end

  end
end
