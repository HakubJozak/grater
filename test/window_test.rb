require_relative 'test_helper'

class WindowTest < Test::Unit::TestCase
  setup do
    @pid = Process.spawn("xcalc &")
    @win = Grater::Window.new
  end

  teardown do
    Process.kill('HUP',@pid) if @pid
  end

  test 'name' do
    
  end
end
