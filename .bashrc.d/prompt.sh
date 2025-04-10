# Function to check if the current directory is a Git repository
is_git_repo() {
    git rev-parse --is-inside-work-tree > /dev/null 2>&1
}

# Function to display Git branch
parse_git_branch() {
    if is_git_repo; then
        git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
    fi
}

# Function to check Git status
git_status() {
    if is_git_repo; then
        if git diff --quiet 2>/dev/null; then
            echo "✔"  # Clean branch (no changes)
        else
            echo "✘"  # Dirty branch (uncommitted changes)
        fi
    fi
}

# Custom PS1 with clean design, pastel colors, and Git info
export PS1="\[\e[94m\]┌─ \u@\h\[\e[0m\] \[\e[93m\]\w\[\e[0m\]\[\e[92m\]\$(parse_git_branch)\[\e[0m\]\[\e[95m\]\$(git_status)\[\e[0m\]\n\[\e[94m\]└─ \$\[\e[0m\] "