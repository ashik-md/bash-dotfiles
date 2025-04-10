# Automatically append to bash history instead of overwriting
shopt -s histappend

# Ignore duplicate commands in history
HISTCONTROL=ignoredups:erasedups

# Enable color support for `ls`
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
fi

# Case-insensitive globbing (for file matching)
shopt -s nocaseglob

# Enable recursive globbing (e.g., `**/*.js`)
shopt -s globstar
