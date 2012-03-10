export EDITOR='vim'
export VISUAL='vim'

# this is implied by setting editor to vim, but making it explicit
bindkey -v

# fix some annoying things about vim-mode
bindkey '^R' history-incremental-search-backward
bindkey '^?' backward-delete-char
bindkey '^E' vi-end-of-line
bindkey '^A' vi-beginning-of-line
