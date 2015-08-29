# Path to your oh-my-zsh installation.
export ZSH=/Users/lorin/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git autojump vi-mode)

# User configuration

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/texbin"


# export MANPATH="/usr/local/man:$MANPATH"
#
#
source $ZSH/oh-my-zsh.sh

# Customize prompt to show the number of background jobs
# Copy-pasted from robbyrussesel.zsh-time with minor modifications
local ret_status="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ %s)"
local prompt_jobs="%(1j.%{$fg[yellow]%}%j%{$reset_color%}%{$fg[red]%}z%{$reset_color%} .)"
local rr_prompt='${ret_status}%{$fg_bold[green]%}%p %{$fg[cyan]%}%c %{$fg_bold[blue]%}$(git_prompt_info)%{$fg_bold[blue]%} % %{$reset_color%}'
local rr_prompt_no_ret_status='%{$fg_bold[green]%}%p %{$fg[cyan]%}%c %{$fg_bold[blue]%}$(git_prompt_info)%{$fg_bold[blue]%} % %{$reset_color%}'
PROMPT="${prompt_jobs}${rr_prompt_no_ret_status}"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"
export NVIM_TUI_ENABLE_CURSOR_SHAPE=1

# Set it for GUI apps
export JAVA_HOME=$(/usr/libexec/java_home)
launchctl setenv JAVA_HOME $JAVA_HOME

# Don't page if it's less than a full screen
export PAGER="less -F -X"


# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#
# Aliases
#

alias activate="pyenv activate ${PWD##*/}"
alias amend="git commit --amend --no-edit"
alias gdt="git difftool"
alias idea="/Applications/IntelliJ\ IDEA\ 14\ CE.app/Contents/MacOS/idea"
alias master="git fetch origin master:master"
alias nvimrc="vim ~/.nvimrc"
alias dir="pwd | pbcopy"
alias gitconfig="vim ~/.gitconfig"
alias vim=nvim
alias vimrc=nvimrc
alias zshrc="vim ~/.zshrc"
alias zshrc.local="vim ~/.zshrc.local"

# git aliases
# alias gs="git status"
# alias ga="git add -p . && git add ."
alias ci="git ci"

# Fix the cursor's shape so it's an underscore
function fix {
   print -n -- "\E]50;CursorShape=2\C-G"
}

function nvim {
    /usr/local/bin/nvim $@
    fix
}

# Some leftover emacs bindings even though we use
# vim mode
bindkey -v
bindkey "^R" history-incremental-search-backward
bindkey "^A" beginning-of-line
bindkey "^E" end-of-line
bindkey "^K" kill-whole-line
bindkey "^D" delete-char

# scmpuff
eval "$(scmpuff init -s)"

# pyenv-virtualenvwrapper
eval "$(pyenv init -)"
if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi


source /Users/lorin/.iterm2_shell_integration.zsh
source ~/.zshrc.local
