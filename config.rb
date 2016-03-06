TERMINAL = /gnome-terminal-server.Gnome-terminal/

emacs('ctrl + j ; ctrl + j') {
  activate /emacs.*.Emacs24/, 'emacs &'
}


browse('ctrl + j ; ctrl + i') {
  activate /google-chrome.google-chrome/,'google-chrome &'
}

terminal('ctrl + j ; ctrl + k') {
  activate TERMINAL,'gnome-terminal &'
}

slack('ctrl + j ; ctrl + s') {
  activate /slack.Slack/,'slack &'
}

vlc('ctrl + j ; v') {
  activate /VLC/,'vlc &'
}

[7,8,9,0].each do |i|
  send("mark_#{i}","ctrl + j ; m ; #{i}") {
    @marks[i] = Grater::Window.active
  }

  send("recall_#{i}","ctrl + j ; #{i}") {
    w.activate if w = @marks[i]
  }
end

6.times do |i|
 send("desktop_#{i}","ctrl + j ; #{i}") {
   wmctrl "-s #{i-1}"
 }
end

# Nyx
# nyx('ctrl + j ; ctrl + n') {
#   activate(web_app: 'epjahignhcbaegaljboenneempmgadoo')
# }


# TODO:
# Google ranslate
# bind 'ctrl + n ; t', 'xdotool <>'
#
# mark window - activate marked window



# class Grater::Dsl::Handler
#   def chrome_fake(key,original)
#     w = Grater::Window.active

#     if w.group =~ /google-chrome|emacs|gnome-terminal-server/
#       w.send_key(key)
#     else
#       w.send_key(original)
#     end
#   end
# end


# 6.times do |i|
#   send "tmux#{i}", "ctrl + j ; #{i}" do
#     if w = Grater::Window.find(TERMINAL)
#       w.send_key "ctrl+t #{i}"
#     end
#   end
# end


# backspace 'ctrl + h' do
#   chrome_fake 'BackSpace', 'ctrl+h'
# end

# enter 'ctrl + m' do
#   chrome_fake 'Return', 'ctrl+m'
# end
