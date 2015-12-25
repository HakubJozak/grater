class Grater::Window

  attr_accessor :id, :title, :name

  def initialize(line)
    @id, @desktop, @group, @box, @title = line.split
  end

  def self.find(str)
    r = `wmctrl -lx | grep #{str}`

    unless r.strip.empty?
      new(r.strip)
    end
  end

  def self.active
    out = `wmctrl -a :ACTIVE: -v 2>&1`
    id = out.split('Using window: ').last
    new(id)
  end
  
  def to_dmenu
    Dmenu::Item.new(@title)
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

  private

  def wmctrl(switches)
    run "wmctrl -i #{switches}"
    self
  end

  def run(cmd)
    puts cmd
    `#{cmd}`.strip
  end

end
