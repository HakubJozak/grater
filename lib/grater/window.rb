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
  
  def name
    wmctrl '-lx'
  end

  def to_dmenu
    Dmenu::Item.new(@title)
  end

  def activate
    wmctrl "a"
  end

  def summon
    wmctrl "R"
  end

  def close
    wmctrl "c"
  end

  private

  def run(cmd)
    puts cmd
    `#{cmd}`.strip
  end

  def wmctrl(switches)
    cmd "wmctrl -i #{switches} #{@id}"
    self
  end


end
