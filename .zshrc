# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Aliases
alias vim="/usr/local/bin/vim"
alias vimrc="vim ~/.vimrc"
alias zshrc="vim ~/.zshrc"
alias amend="git commit --amend --no-edit"
alias gci="git commit -v"
alias index="find . -name index.html | head -n1 | xargs open"
alias gitx="open -a GitX ."
alias alloy="java -jar /Applications/Alloy4.2_2014-03-07.app/Contents/Resources/Java/alloy4.2_2014-03-07.jar"

function vimp {
    bundle=("${(s:/:)1}")
    hub clone $1 ~/.vim/bundle/${bundle[2]}
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
plugins=(git autojump bundler rbenv brew vagrant virtualenvwrapper heroku)

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

source  ~/.zshrc.local
