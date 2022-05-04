
alias br="git branch --show-current | tr -d '\n' | pbcopy && pbpaste"
alias c="git add . && git commit -m 'checkpoint'"
alias init="touch README.md && git init && git add ."
alias files="git files"
alias fgit="SPOTLESS_SKIP=1 git"
alias g="SPOTLESS_SKIP=1 git"
alias gitconfig="code ~/.gitconfig"
alias gdt="git difftool main"
alias gg="SPOTLESS_SKIP=1 git"
alias lg=lazygit
alias pull="git pull"
alias pr="gh pr checkout"
alias sw="git switch -"
