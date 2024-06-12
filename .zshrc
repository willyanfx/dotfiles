# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Git
alias gcm='git commit -m'
alias gcam='git commit -a -m'
alias gcad='git commit -a --amend'
alias gp="git push origin HEAD"
alias gpu="git pull origin"
alias gst="git status"
alias glog="git log --graph --topo-order --pretty='%w(100,0,6)%C(yellow)%h%C(bold)%C(black)%d %C(cyan)%ar %C(green)%an%n%C(bold)%C(white)%s %N' --abbrev-commit"
alias gdiff="git diff"
alias gco="git checkout"
alias gb='git branch'
alias gba='git branch -a'
alias gadd='git add'
alias ga='git add -p'
alias gcoall='git checkout -- .'
alias gr='git remote'
alias gre='git reset'
alias gs="git status"


# Tools
alias n='nvim'
alias g='git'
# alias bat='batcat'

# Editor used by CLI
export EDITOR="nvim"
export SUDO_EDITOR="nvim"


# Directories
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'


if [ -d "/opt/homebrew/opt/ruby/bin" ]; then
  export PATH=/opt/homebrew/opt/ruby/bin:$PATH
  export PATH=`gem environment gemdir`/bin:$PATH
fi

# PYTHON 3
alias python=/opt/homebrew/bin/python3
# VIM
alias v="/opt/homebrew/bin/nvim"


# Shopify Hydrogen alias to local projects
alias h2='$(npm prefix -s)/node_modules/.bin/shopify hydrogen'
# bun completions
[ -s "/Users/wgeraldo/.bun/_bun" ] && source "/Users/wgeraldo/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# Rust
export PATH="$HOME/.cargo/bin:$PATH"


eval "$(zoxide init zsh)"
eval "$(starship init zsh)"
eval "$(zellij setup --generate-auto-start zsh)"