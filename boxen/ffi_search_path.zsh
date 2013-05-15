# Allow FFI to find homebrew libraries installed under boxen.
# export LD_LIBRARY_PATH=/opt/boxen/homebrew/lib

# Work around Mountain Lion Bug showing a warning whenever you sudo.
# see: http://stackoverflow.com/questions/12064725/dyld-dyld-environment-variables-being-ignored-because-main-executable-usr-bi
# sudo () { ( unset LD_LIBRARY_PATH DYLD_LIBRARY_PATH; exec command sudo $* ) }
