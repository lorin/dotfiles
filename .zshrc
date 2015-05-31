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

# Up the file limit
ulimit -S -n 10240

# Quote quotes like this: isn''t
setopt rcquotes


# Aliases
alias s="bin/rspec spec --format progress --fail-fast"
alias vi=vim
alias vim="/usr/local/bin/vim"
alias vim="/usr/local/bin/nvim"
alias vimr="open -a VimR"
alias vimrc="vim ~/.vimrc"
alias nvimrc="vim ~/.nvimrc"
alias zshrc="vim ~/.zshrc"
alias gitconfig="vim ~/.gitconfig"
alias zshrclocal="vim ~/.zshrc.local"
alias amend="git commit --amend --no-edit"
alias gci="git commit -v"
alias index="find . -name index.html | head -n1 | xargs open"
alias i="open _build/html/index.html"
alias gitx="open -a GitX ."
alias make="/usr/local/Cellar/make/4.0/bin/make"
alias pf="open -a Path\ Finder"
alias ctags="/usr/local/bin/ctags"
alias sha="git sha"
alias tags="ctags *.h *.cpp"
alias t="ctags -R ."
alias uuid="uuidgen | tr -d - | tr '[:upper:]' '[:lower:]' | tr -d '\n' | pbcopy ; pbpaste ; echo"
alias ec2="aws ec2"
alias describe-instances="aws ec2 describe-instances --instance-ids"
alias dir="pwd | pbcopy"
alias qss="pkill QuickSilver ; open -a QuickSilver"
alias a="ansible"
alias an="ansible-playbook"
alias ap="ansible -m ping"
alias al="ansible localhost"
alias r="rails"
alias ip="curl -s icanhazip.com | tr -d '\n' | pbcopy ; pbpaste ; echo"
alias cuc="bundled_cucumber --tags ~@ignore"
alias reflog="git reflog"
alias tac="gtac"
alias emacs="/Users/lorinhochstein/Applications/Aquamacs.app/Contents/MacOS/Aquamacs"
alias notebook="ipython notebook"
alias vssh="vagrant ssh"
alias master="git fetch origin master:master"
alias file="file -h"
alias idea="setopt NO_HUP; setopt NO_CHECK_JOBS; /Applications/IntelliJ\ IDEA\ 14\ CE.app/Contents/MacOS/idea"

# Zap the current git branch, which has already been merged upstream
function zap {
    CURRENT_BRANCH=$(git rev-parse --abbrev-ref HEAD)
    git checkout master
    git pull --prune
    git branch -d $CURRENT_BRANCH
}

function instances {
    aws ec2 describe-instances | jq '.Reservations'
}

function instance {
    aws ec2 describe-instances --instance-ids $1 | jq -r '.Reservations[].Instances[]'
}
function branch {
    git rev-parse --abbrev-ref HEAD | tr -d '\n' | pbcopy ; pbpaste ; echo
}

function console {
    aws ec2 get-console-output --instance-id $1 | jq ".Output" | gsed -e 's/\\r//g' -e 's/\\n/\n/g'
}

function in {
    aws ec2 describe-instances --instance-ids $1 | jq ".Reservations[0].Instances[0]"
}

function json {
    jq "" < $1
}

# Workaround for https://github.com/robbyrussell/oh-my-zsh/issues/2673
alias readlink=greadlink

function vimp {
    bundle=("${(s:/:)1}")
    hub clone $1 ~/.vim/bundle/${bundle[2]}
}

function alloy {
    java -jar /Applications/Alloy4.2_2014-03-07.app/Contents/Resources/Java/alloy4.2_2014-03-07.jar $1 &
}

function precise {
ubuntu-ami-locator --itype ebs --region us-east-1 --suite precise --stream server --arch amd64 --tag release --current | tr -d '\n' | pbcopy && pbpaste && echo
}

function trusty {
ubuntu-ami-locator --itype ebs --region us-east-1 --suite trusty --stream server --arch amd64 --tag release --current | tr -d '\n' | pbcopy && pbpaste && echo
}
function postCallVim
{
  osascript -e 'tell application "MacVim" to activate'
}

function circle {
    repo=$(git remote -v | head -n1 | awk '{ print $2 }' | sed 's/git@github.com:\(.*\).git/\1/')
    open "https://circleci.com/gh/$repo"
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

function commit
{
    repo=$(git remote show origin -n | grep "Fetch URL" | sed 's/.*:\(.*\)\.git/\1/')
    hub browse $repo commit/$1
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
plugins=(git autojump bundler rbenv brew vagrant heroku vim-interaction vi-mode virtualenvwrapper)


source $ZSH/oh-my-zsh.sh

# Don't want to have to quote square brackets
alias bundled_rake="noglob bundled_rake"

# Customize prompt to show the number of background jobs
# Copy-pasted from robbyrussesel.zsh-time with minor modifications
local ret_status="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ %s)"
local prompt_jobs="%(1j.%{$fg[yellow]%}%j%{$reset_color%}%{$fg[red]%}z%{$reset_color%} .)"
local rr_prompt='${ret_status}%{$fg_bold[green]%}%p %{$fg[cyan]%}%c %{$fg_bold[blue]%}$(git_prompt_info)%{$fg_bold[blue]%} % %{$reset_color%}'
local rr_prompt_no_ret_status='%{$fg_bold[green]%}%p %{$fg[cyan]%}%c %{$fg_bold[blue]%}$(git_prompt_info)%{$fg_bold[blue]%} % %{$reset_color%}'
PROMPT="${prompt_jobs}${rr_prompt_no_ret_status}"

# Make mvn happy
# This causes a problem with gradle (Classs JavaHelpLauncher is implemented in both..), so we comment it out
# export JAVA_HOME=$(/usr/libexec/java_home)

# Antlr
export CLASSPATH=.:/usr/local/Cellar/antlr/4.4/antlr-4.4-complete.jar

# User configuration
#export EDITOR="subl -w"
export EDITOR="vim"


# Don't page if it's less than a full screen
export PAGER="less -F -X"

# make vim happy
export TERM=xterm-256color

# Go wants a GOPATH
export GOPATH=$HOME/go

PATH="/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:$GOPATH/bin:/usr/local/opt/go/libexec/bin:/usr/texbin"

export PATH=~/.local/bin:$PATH

export K2PDFOPT="-dev kpw"

# Needed by xmllint to find AsciiDoc's catalog files
export XML_CATALOG_FILES=/usr/local/etc/xml/catalog

[ -s ~/.scm_breeze/scm_breeze.sh ] && source ~/.scm_breeze/scm_breeze.sh

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

### rbenv support
eval "$(rbenv init -)"

# Docker stuff is in .zshrc.local

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
source ~/aws_zsh_completer.sh
source ~/.iterm2_shell_integration.zsh

