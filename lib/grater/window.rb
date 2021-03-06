class Grater::Window
  include Grater::Runner

  attr_accessor :id, :title, :name, :group

  def initialize(line)
    @id, @desktop, @group, @box, @title = line.split(/\s+/,5)
  end

  def self.find(pattern)
    r = `wmctrl -lx`.lines.find { |l| l =~ pattern }
    new(r.strip) if r
  end

  def self.active
    out = `wmctrl -a :ACTIVE: -v 2>&1`
    id = out.split('Using window: ').last
    new(`wmctrl -lx | grep #{id}`.strip)
  end

  def to_dmenu
    Dmenu::Item.new(@title)
  end

  def send_key(key)
    run "xdotool key --window #{@id} #{key}"
  end

  def activate
    wmctrl "-a #{@id}"
  end

  def summon
    wmctrl "-R #{@id}"
  end

  def maximize
    wmctrl "-r #{@id} -b add,maximized_vert,maximized_horz"
  end

  def unmaximize
    wmctrl "-r #{@id} -b remove,maximized_vert,maximized_horz"
  end

  def maximize_x
    wmctrl "-r #{@id} -b add,maximized_horz"
  end

  def maximize_y
    wmctrl "-r #{@id} -b add,maximized_vert"
  end

  def shade
    wmctrl "-r #{@id} -b add,shaded"
  end

  def unshade
    wmctrl "-r #{@id} -b remove,shaded"
  end

  def close
    wmctrl "-c #{@id}"
  end

  def move(dx=0,dy=0,dw=-1,dh=-1)
    unshade
    unmaximize
    wmctrl "-r #{@id} -e 0,#{dx},#{dy},#{dw},#{dh}"
  end

end
