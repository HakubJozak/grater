require_relative 'test_helper'

class GraterTest < Test::Unit::TestCase
  test 'version' do
    refute_nil ::Grater::VERSION
  end
end
