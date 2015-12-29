def process(command)
  # TODO: DSL this
  case command
  when 'emacs'
    Grater::Window.summon_or_run(/emacs.Emacs/,'emacs &')

  when 'browse'
    w = Grater::Window.summon_or_run(/google-chrome.google-chrome/,'google-chrome')

  when 'slack'
    w = Grater::Window.summon_or_run(/slack.Slack/,'slack &')

  when 'terminal'
    w = Grater::Window.summon_or_run(/gnome-terminal-server.Gnome-terminal/,'gnome-terminal')    

  when 'files'
    Grater::Window.summon_or_run(/desktop_window.Nautilus/,'nautilus')

  when 'nyx'
    chrome_app('epjahignhcbaegaljboenneempmgadoo')

  when 'gmail'
    chrome_app('pjkljhegncpnkpknbcohdijeoejaedia')

  when 'youtube'
    puts 'you'

  when 'youtube'
    chrome_app('blpcfgokakmgnkcojhhkbfbldkacnbeo')
  else
    puts "Unknown command #{command}"
  end
end
