# == root zsh config for shells

# Include all files with a .zshconfig suffix in this directory
for config in $ZDOTDIR/*.zshconfig; do
  source $config
done
