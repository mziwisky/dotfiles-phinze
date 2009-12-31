#!/usr/bin/env bash
xmodmap ~/.Xmodmap                    # Make capslock an additional ctrl in X
#gnome-settings-daemon &              # handles themes, starts gnome-screensaver. You may have to
                                      # use gconf to disable it setting the background.
#nm-applet &                           # assuming you're using Network Manager
#gnome-power-manager &                 # for laptop, suspend, etc.
#update-notifier &                     # aptly named, notifies about updates
#/usr/lib/at-spi/at-spi-registryd &   # prevent every gui application from complaining about at-spi
#xcompmgr > /dev/null &               # transparency niceness (no need for it, really)
#hsetroot -full /home/phinze/img/Through_the_night_by_Orioto.jpg # Set a wallpaper
# setup ssh-agent
#eval `/usr/bin/ssh-agent`
#SSH_ASKPASS=/usr/lib/openssh/x11-ssh-askpass ssh-add < /dev/null
xscreensaver -no-splash &
xrdb ~/.Xresources
xbindkeys &
eval $(gpg-agent --daemon -vvv --log-file ~/.gpg-agent.log)
exec /usr/bin/awesome
