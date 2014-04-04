# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"
DEFAULT_USER=lorinhochstein
#
# Powerline
#ZSH_THEME="powerline"
#POWERLINE_HIDE_USER_NAME="true"
#POWERLINE_HIDE_HOST_NAME="true"
##POWERLINE_SHOW_GIT_ON_RIGHT="true"
#POWERLINE_RIGHT_A="exit-status"
#POWERLINE_RIGHT_B="none"



# Aliases
alias vim="/usr/local/bin/vim"
alias vimrc="vim ~/.vimrc"
alias zshrc="vim ~/.zshrc"
alias amend="git commit --amend --no-edit"
alias gci="git commit -v"
alias index="find . -name index.html | head -n1 | xargs open"
alias gitx="open -a GitX ."
alias make="/usr/local/Cellar/make/4.0/bin/make"
alias pf="open -a Path\ Finder"
alias ctags="/usr/local/bin/ctags"
alias tags="ctags *.h *.cpp"

alias readlink=greadlink

function vimp {
    bundle=("${(s:/:)1}")
    hub clone $1 ~/.vim/bundle/${bundle[2]}
}

function alloy {
    java -jar /Applications/Alloy4.2_2014-03-07.app/Contents/Resources/Java/alloy4.2_2014-03-07.jar $1 &
}

function postCallVim
{
  osascript -e 'tell application "MacVim" to activate'
}

function vp
{
    url=$(
        osascript 2>/dev/null <<EOF
    tell application "Google Chrome"
        get URL of active tab of first window
    end tell
EOF
    )
    elts=(${(s:/:)url})
    pkg=$elts[-2]/$elts[-1]
    if [[ $elts[2] == "github.com" ]]; then
        echo "Installing $pkg"
        vimp $pkg
    else
        echo "Not a Github repo: $url"
    fi
}


# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Uncomment this to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment following line if you want to  shown in the command execution time stamp
# in the history command output. The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|
# yyyy-mm-dd
# HIST_STAMPS="mm/dd/yyyy"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
#plugins=(git autojump bundler rbenv brew vagrant heroku vim-interaction vi-mode)
plugins=(git autojump bundler rbenv brew vagrant heroku vim-interaction)

source $ZSH/oh-my-zsh.sh

# User configuration
#export EDITOR="subl -w"
export EDITOR="vim"

# Don't page if it's less than a full screen
export PAGER="less -F -X"

# make vim happy
export TERM=xterm-256color

export PATH="/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin"

[ -s ~/.scm_breeze/scm_breeze.sh ] && source ~/.scm_breeze/scm_breeze.sh

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

### rbenv support
eval "$(rbenv init -)"

# Docker
# http://docs.docker.io/en/latest/installation/mac/
export DOCKER_HOST=tcp://

# Development version of ansible
#source ~/dev/ansible/hacking/env-setup


# added by travis gem
[ -f ~/.travis/travis.sh ] && source ~/.travis/travis.sh

# Some leftover emacs bindings even though we use
# vim mode
bindkey -v
bindkey "^R" history-incremental-search-backward
bindkey "^A" beginning-of-line
bindkey "^E" end-of-line
bindkey "^K" kill-whole-line
bindkey "^D" delete-char

source  ~/.zshrc.local

