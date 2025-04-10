alias d="cd ~/Downloads"
alias ar="~/bin/aria2c_script.sh"
alias yt="~/bin/yt-dlp_script.sh"

# General Aliases
alias ll='ls -la --color=auto'  # List files in long format with hidden files (colored)
alias la='ls -A --color=auto'   # List all files including hidden ones (colored)
alias ..='cd ..'                # Go up one directory
alias ...='cd ../..'            # Go up two directories
alias c='clear'                 # Clear the terminal screen
alias h='history'               # Show command history
alias grep='grep --color=auto'  # Colorize grep output

# Git Aliases
alias gs='git status'           # Show git status
alias ga='git add'              # Add files to staging
alias gc='git commit -m'        # Commit changes with message
alias gp='git push'             # Push to remote
alias gpl='git pull'            # Pull from remote
alias gb='git branch'           # List branches
alias gco='git checkout'        # Checkout a branch
alias gd='git diff'             # Show differences between commits
alias gl='git log --oneline'    # Show git log in a concise format

# Node.js & NPM Aliases
alias nr='npm run'              # Shortcut for npm run
alias ni='npm install'          # Install npm packages
alias nis='npm install --save'  # Install and save npm package
alias nid='npm install --save-dev'  # Install and save as dev dependency
alias ns='npm start'            # Start npm project
alias nb='npm build'            # Build npm project

# Flutter Aliases
alias fgc='flutter clean'       # Clean flutter project
alias fgp='flutter pub get'     # Get flutter dependencies
alias fr='flutter run'          # Run flutter app
alias fdr='flutter doctor'      # Check flutter setup

# Docker Aliases
alias dc='docker-compose'       # Shortcut for docker-compose
alias dcr='docker-compose run'  # Run a service in docker-compose
alias dcb='docker-compose build' # Build docker-compose services
alias dps='docker ps'           # List running containers
alias drm='docker rm -f'        # Remove a container forcefully
