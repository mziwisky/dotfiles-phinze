function bgrep() {
  grep -R "$@" `bundle show --paths`
}
