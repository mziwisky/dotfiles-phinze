expand-or-complete-with-dots() {
  echo -n "\e[31m......\e[0m"
  zle expand-or-complete
  zle redisplay
}
zle -N expand-or-complete-with-dots
bindkey "^I" expand-or-complete-with-dots

fpath=($ZSH/zsh/functions $fpath)
autoload -U $ZSH/zsh/functions/*(:t)

homebrew_zsh=$(brew --prefix zsh)/share/zsh
fpath=($homebrew_zsh/functions $fpath)
autoload -U $homebrew_zsh/functions/*(:t)

autoload -Uz compinit
compinit -i

zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*' accept-exact-dirs true
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh-cache


