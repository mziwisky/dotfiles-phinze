# case $TERM in
#   screen*)
#     precmd(){
#       # Restore tmux-title to 'zsh'
#       printf "\033kzsh $(pwd | sed -e "s,^$HOME,~,")\033\\"
#     }
#     preexec(){
#       # set tmux-title to running program
#       printf "\033k$(echo "$1")\033\\"
#     }
#     ;;
# esac
