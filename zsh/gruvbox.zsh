if [ -x ~/.vim/bundle/gruvbox/gruvbox_256palette_osx.sh ]; then
  ~/.vim/bundle/gruvbox/gruvbox_256palette_osx.sh
fi

# With gruvbox we are rocking custom -italic $TERM, which don't exist in
# terminfo remote hosts, so we need to set the remote-friendly $TERM when
# sshing
SSHTERM=$(echo $TERM | sed 's/-italic//')

function ssh() {
  env TERM=$SSHTERM ssh "$@"
}
