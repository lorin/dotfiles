alias agf="ag -l"
alias agt="tag -g '!*test'"
alias announce="cd ~/dev/announce-clj; just"
alias ann=announce
alias a=announce
#alias announce="/usr/local/bin/announce on"
#alias denounce="/usr/local/bin/announce off"
# alias announce="defaults write ~/Library/Preferences/com.apple.speech.synthesis.general.prefs TimeAnnouncementPrefs -dict-add TimeAnnouncementsEnabled -bool YES && launchctl kickstart gui/$UID/com.apple.speech.synthesisserver"
# alias denounce="defaults write ~/Library/Preferences/com.apple.speech.synthesis.general.prefs TimeAnnouncementPrefs -dict-add TimeAnnouncementsEnabled -bool NO && launchctl kill SIGTERM gui/$UID/com.apple.speech.synthesisserver && launchctl kill SIGTERM gui/$UID/com.apple.speech.synthesisserver"
#alias nounce="launchctl print gui/$UID/com.apple.speech.synthesisserver | head -n4"
alias b="bat"
alias co="code ."
alias dir="pwd | tr -d '\n' | pbcopy"
alias gron="gron -c"
alias gitconfig="code ~/.gitconfig"

# https://github.com/pqrs-org/Karabiner-Elements/issues/2780#issuecomment-991421683
alias kara="sudo launchctl bootout gui/${UID}/org.pqrs.karabiner.NotificationWindow"
alias ki="~/ki/bin/ki.sh"
alias l="exa -lah --git"
alias ls="exa"
alias ll="ls -l --git"
alias m="just || make"

# take clipboard string and unescape the \n and \t stuff
alias n="pbpaste | xargs gecho -e | tee /dev/tty | pbcopy"
alias p="git push"
alias pbaste=pbpaste
alias pf="open -a Path\ Finder.app"
alias sha='head -c 64 /dev/urandom | shasum -b | cut -c1-9 | tr -d '\n' | pbcopy && pbpaste'
alias t="ls -T"
alias today="date -u +%F"
alias v=nvim
alias vim=nvim
alias vimrc="nvim ~/.config/nvim/init.vim"
alias zshrc="code ~/.zshrc"
