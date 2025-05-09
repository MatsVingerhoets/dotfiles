# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH


# Check for macOS environment
if [[ "$(uname)" == "Darwin" ]]; then
  export JAVA_HOME=$(/usr/libexec/java_home -v 1.8.0)
  export ANDROID_SDK=/Users/matsvingerhoets/Library/Android/sdk
fi

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export PATH=/opt/homebrew/bin:$PATH
export PROJECT_FOLDER=~/Documents/projects
if [[ -d "$HOME/.zsh/zsh-autosuggestions" ]]; then
  source $HOME/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
fi
# Add other necessary paths (in devcontainer or macOS)
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/Documents/nvim-macos/bin:$PATH"
export PATH="/opt/nvim/bin:$PATH"
# Set theme and other settings for Oh My Zsh
ZSH_THEME="eastwood"

export PATH="/usr/local/opt/libpq/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="/Users/matsvingerhoets/Library/Application Support/neovim/bin:$PATH"
export PATH="$HOME/Documents/nvim-macos/bin:$PATH"
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin" 
export PATH="$HOME/.config/nvim:$PATH"

alias psql="psql -U postgres -h localhost -p 5432"
alias createdb="createdb -U postgres -h localhost -p 5432"
alias createuser="createuser -U postgres -h localhost -p 5432"
alias dropdb="dropdb -U postgres -h localhost -p 5432"
alias pg_dump="pg_dump -U postgres -h localhost -p 5432"
# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="eastwood"

# FZF options
# fshow - git commit browser
fshow() {
  git log --graph --color=always \
      --format="%C(auto)%h%d %s %C(black)%C(bold)%cr" "$@" |
  fzf --ansi --no-sort --reverse --tiebreak=index --bind=ctrl-s:toggle-sort \
      --bind "ctrl-m:execute:
                (grep -o '[a-f0-9]\{7\}' | head -1 |
                xargs -I % sh -c 'git show --color=always % | less -R') << 'FZF-EOF'
                {}
FZF-EOF"
}

function fzf_gitbranches() {
  git for-each-ref --sort='authordate:iso8601' --format='%(authordate:relative)%09%(refname:short)' refs/heads | fzf --tac --bind 'enter:execute(echo {} | rev | cut -f1 | rev | xargs git checkout)+abort,tab:execute-silent(echo {} | rev | cut -f1 | rev | pbcopy)+abort'
  zle reset-prompt
  zle redisplay
}
zle -N fzf_gitbranches
bindkey "^y" fzf_gitbranches

# Initialize plugins array
plugins=(git fzf)

# Check if zsh-autosuggestions exists and add it to plugins if available
if [[ -d "$HOME/.zsh/zsh-autosuggestions" ]]; then
  plugins+=(zsh-autosuggestions)
fi

# zsh aliases
alias zshconfig="code . ~/.zshrc"
alias ohmyzsh="code . ~/.oh-my-zsh"

# git aliases
alias ginit="git init ."
alias gt="git status"
alias ga="git add ."
alias gpf="git push --force-with-lease"
alias gp="git push"
alias gcm='git commit --message'
alias gcam='git commit --amend'
alias gch='git checkout'
alias gchm='git checkout main'
alias gchb='git checkout -b'

# COLORS
local nord0_term="-1"
local nord1_term="0"
local nord3_term="8"
local nord5_term="7"
local nord6_term="15"
local nord7_term="14"
local nord8_term="6"
local nord9_term="4"
local nord10_term="12"
local nord11_term="1"
local nord12_term="11"
local nord13_term="3"
local nord14_term="2"
local nord15_term="5"

export FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS"\
" --color=bg+:$nord1_term,bg:$nord0_term,spinner:$nord9_term,hl:$nord3_term"\
" --color=fg:$nord5_term,header:$nord8_term,info:$nord10_term,pointer:$nord9_term"\
" --color=marker:$nord9_term,fg+:$nord6_term,prompt:$nord9_term,hl+:$nord9_term"
alias python=/usr/bin/python3
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"
