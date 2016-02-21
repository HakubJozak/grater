# TODO:
# Google ranslate
# bind 'ctrl + n ; t', 'xdotool <>'
#
# mark window - activate marked window

TERMINAL = /gnome-terminal-server.Gnome-terminal/

class Grater::DSL::Handler
  def chrome_fake(key,original)
    w = Grater::Window.active

    if w.group =~ /google-chrome|emacs|gnome-terminal-server/
      w.send_key(key)
    else
      w.send_key(original)
    end
  end
end


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

5.times do |i|
 send("desktop_#{i}","ctrl + j ; #{i}") {
   wmctrl "-s #{i-1}"
 }
end

# Nyx
# nyx('ctrl + j ; ctrl + n') {
#   activate(web_app: 'epjahignhcbaegaljboenneempmgadoo')
# }
