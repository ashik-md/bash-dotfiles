# Set default editor to VS Code
export EDITOR="code --wait"

# Increase bash history size
export HISTSIZE=10000
export HISTFILESIZE=20000

# Add global npm binaries to PATH
export PATH=$PATH:$HOME/.npm-global/bin

# Flutter path (adjust according to your installation)
export PATH="$HOME/development/flutter/bin:$PATH"

# Node.js version manager (if using nvm)
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \\. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \\. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Docker Compose alias (optional)
export COMPOSE_HTTP_TIMEOUT=120

# Git configuration
export GIT_EDITOR="code --wait"
