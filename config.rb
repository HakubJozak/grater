# TODO:
# Google ranslate
# bind 'ctrl + n ; t', 'xdotool <>'
#
# mark window - activate marked window

backspace 'ctrl + h' do
 w = Grater::Window.active

  if w.group =~ /google-chrome|emacs/
    puts 'sdfdsf'
    w.send_key('BackSpace')
  else
    puts 'bb'
    w.send_key('ctrl+h')
  end
end

emacs('ctrl + j ; ctrl + j') {
  activate /emacs.*.Emacs24/, 'emacs &'
}


browse('ctrl + j ; ctrl + i') {
  activate /google-chrome.google-chrome/,'google-chrome &'
}

terminal('ctrl + j ; ctrl + k') {
  activate /gnome-terminal-server.Gnome-terminal/,'gnome-terminal &'
}

slack('ctrl + j ; ctrl + s') {
  activate /slack.Slack/,'slack &'
}

# Nyx
nyx('ctrl + j ; ctrl + n') {
  activate(web_app: 'epjahignhcbaegaljboenneempmgadoo')
}
