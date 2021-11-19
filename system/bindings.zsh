# vi bindings with ctrl-a and ctrl-e emacs sytle
bindkey -v
bindkey "^A" vi-beginning-of-line
bindkey "^E" vi-end-of-line

# v invokes nvim
export VISUAL=nvim
autoload edit-command-line; zle -N edit-command-line
bindkey -M vicmd v edit-command-line
