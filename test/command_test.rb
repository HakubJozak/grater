require_relative 'test_helper'
require_relative '../lib/grater'

class CommandTest < Test::Unit::TestCase
  setup do
    @cmd = Grater::Command.new('emacs', 'Alt + 1',/emacs.Emacs/,'emacs-client')
  end

  test '#to_xbindkeysrc' do
    r = <<-EOF
"/home/jakub/code/my/grater/bin/grater emacs"
  Alt + 1
EOF

    assert_equal r, @cmd.to_xbindkeysrc
  end
end
