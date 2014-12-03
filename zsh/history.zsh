# == it's mostly repetition, after all

export HISTFILE=~/.zsh_history # the tome of history
export HISTSIZE=50000
export SAVEHIST=50000

setopt HIST_VERIFY
setopt SHARE_HISTORY # share history between sessions ???
setopt EXTENDED_HISTORY # add timestamps to history

setopt INC_APPEND_HISTORY SHARE_HISTORY  # adds history incrementally and share it across sessions
setopt HIST_IGNORE_ALL_DUPS  # don't record dupes in history
setopt HIST_REDUCE_BLANKS

# Search backwards and forwards with a pattern
bindkey -M vicmd '?' history-incremental-pattern-search-backward
bindkey -M vicmd '/' history-incremental-pattern-search-forward

# set up for insert mode too
bindkey -M viins '^R' history-incremental-pattern-search-backward

# Ctrl-F/B to cycle through matches
bindkey -M viins '^B' history-incremental-pattern-search-backward
bindkey -M viins '^F' history-incremental-pattern-search-forward
