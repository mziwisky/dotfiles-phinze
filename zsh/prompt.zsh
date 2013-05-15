# setopt prompt_subst
# autoload colors && colors
# 
# directory_name(){
#   echo "%{$fg_bold[cyan]%}%~%{$reset_color%}"
# }
# 
# export PROMPT=$'\n $(directory_name) › '
# export PROMPT="$PROMPT"'$([ -n "$TMUX" ] && tmux setenv TMUXPWD_$(tmux display -p "#D" | tr -d %) "$PWD")'
