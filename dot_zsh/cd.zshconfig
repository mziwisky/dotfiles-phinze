# == for getting around town

# cd to dir by typing dir... not sure about this one
setopt AUTO_CD

# always push to the dir stack like `pushd`
setopt AUTO_PUSHD

# Meta-u to chdir to the parent directory
bindkey -s '\eu' '^Ucd ..; ls^M'

# If AUTO_PUSHD is set, Meta-p pops the dir stack
bindkey -s '\ep' '^Upopd >/dev/null; dirs -v^M'
