# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# User-specific environment and startup programs
export PATH=$PATH:$HOME/bin

# Source additional bash configurations from ~/.bashrc.d/
if [ -d ~/.bashrc.d ]; then
    for file in ~/.bashrc.d/*.sh; do
        if [ -r "$file" ]; then
            . "$file"
        fi
    done
fi
