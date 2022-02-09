# Different shells use different files. For this setup, all configs are in .bashrc
# If a shell is loaded trying to load .bash_profile instead of .bashrc, then this
# delegates to the .bashrc file.
#
if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi

