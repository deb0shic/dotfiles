# ── files ──────────────────────────────────────────────────────────
alias ls='ls -G'
alias ll='ls -lah'
alias la='ls -A'
alias mkd='mkdir -p'

# ── git ───────────────────────────────────────────────────────────
alias g='git'
alias gs='git status -sb'
alias gd='git diff'
alias gds='git diff --staged'
alias gl='git log --oneline --graph --decorate --all -20'
alias gco='git checkout'
alias gcm='git commit -m'
alias gp='git push'
alias gpl='git pull --rebase'
alias amend='git commit --amend --no-edit'

# ── nav ───────────────────────────────────────────────────────────
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# ── misc ──────────────────────────────────────────────────────────
alias v='nvim'
alias vim='nvim'
alias c='clear'
alias reload='exec zsh'
alias ports='lsof -iTCP -sTCP:LISTEN -n -P'

