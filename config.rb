prefix('ctrl + j') {
  emacs('ctrl + j') {
    summon /emacs.Emacs24/, 'emacs &'
  }

  browse('w') {
    summon /google-chrome.google-chrome/,'google-chrome'
  }

  terminal('d') {
    summon /gnome-terminal-server.Gnome-terminal/,'gnome-terminal'
  }

  slack('s') {
    summon /slack.Slack/,'slack &'
  }

  # Nyx
  nyx('n') {
    summon_web_app('epjahignhcbaegaljboenneempmgadoo')
  }

  # Gmail
  gmail('m') {
    summon_web_app('pjkljhegncpnkpknbcohdijeoejaedia')
  }

  # YouTube
  youtube('y') {
    summon_web_app('blpcfgokakmgnkcojhhkbfbldkacnbeo')
  }
}
