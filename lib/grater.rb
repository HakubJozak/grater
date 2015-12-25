require "grater/version"
require "grater/runner"
require "grater/dmenu"
require "grater/window"



module Grater
  include Grater::Runner  

  def self.settings
    {
      window_border: 1,
      panel_height: 24,
      titlebar_height: 24,
      panel_width: 0,
      hostname: `hostname`
    }
  end

  class Workspace
    def initialize
      # => 1920x1080
      r = run("wmctrl -d | awk '{ print $9 }' | head -n1")
      w,h = r.split('x').map(&:to_i)

      @w = w - 2 * Grater.settings[:window_border]
      @h = h - 2 * Grater.settings[:window_border]
      @id = cmd("wmctrl -d | grep '\*' | awk '{ print $1 }'").to_i      
    end
  end


end
