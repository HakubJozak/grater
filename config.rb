prefix('ctrl + j') {

  # TODO:
  # Google ranslate
  # bind 'ctrl + n ; t', 'xdotool <>'
  #
  # mark window - activate marked window


  # send escape
  bind 'ctrl + h','xdotool getactivewindow key Escape'

  emacs('ctrl + j') {
    activate /emacs.*.Emacs24/, 'emacs &'
  }


  browse('ctrl + i') {
    activate /google-chrome.google-chrome/,'google-chrome &'
  }

  terminal('ctrl + k') {
    activate /gnome-terminal-server.Gnome-terminal/,'gnome-terminal &'
  }

  slack('s') {
    activate /slack.Slack/,'slack &'
  }

  # Nyx
  nyx('n') {
    activate(web_app: 'epjahignhcbaegaljboenneempmgadoo')
  }

  # Gmail
  gmail('m') {
    activate(web_app: 'pjkljhegncpnkpknbcohdijeoejaedia')
  }

  # YouTube
  youtube('y') {
    activate(web_app: 'blpcfgokakmgnkcojhhkbfbldkacnbeo')
  }
}
