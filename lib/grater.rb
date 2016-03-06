require_relative "grater/version"
require_relative "grater/runner"
require_relative "grater/dmenu"
require_relative "grater/window"
require_relative "grater/command"
require_relative "grater/native_command"
require_relative "grater/dsl"
require_relative "grater/dsl/handler"
require_relative "grater/sxhkd"
require_relative "grater/server"


module Grater
  include Grater::Runner

  # TODO: take it from a config file
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
      border = Grater.settings[:window_border]
      @w,@h = r.split('x').map { |s|  s - 2 * border }
      @number = cmd("wmctrl -d | grep '\*' | awk '{ print $1 }'").to_i
    end
  end
end
