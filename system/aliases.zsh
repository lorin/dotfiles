alias agf="ag -l"
alias agt="tag -g '!*test'"
alias announce="defaults write ~/Library/Preferences/com.apple.speech.synthesis.general.prefs TimeAnnouncementPrefs -dict-add TimeAnnouncementsEnabled -bool YES && open /System/Library/Frameworks/ApplicationServices.framework/Versions/A/Frameworks/SpeechSynthesis.framework/Versions/A/SpeechSynthesisServer.app"
alias denounce="defaults write ~/Library/Preferences/com.apple.speech.synthesis.general.prefs TimeAnnouncementPrefs -dict-add TimeAnnouncementsEnabled -bool NO && killall SpeechSynthesisServer"
alias nounce="defaults read ~/Library/Preferences/com.apple.speech.synthesis.general.prefs TimeAnnouncementPrefs && pgrep SpeechSynthesisServer"
alias b="bat"
alias co="code ."


alias gron="gron -c"
alias gitconfig="code ~/.gitconfig"
alias ki="~/ki/bin/ki.sh"
alias l="exa -lah --git"
alias ls="exa"
alias ll="ls -l --git"
alias m="make"

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
