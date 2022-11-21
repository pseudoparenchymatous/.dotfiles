bindkey -v # vi mode ZLE

autoload -U edit-command-line
zle -N edit-command-line
bindkey -M vicmd v edit-command-line

bindkey '^A' beginning-of-line
bindkey '^E' end-of-line
# Also fix annoying vi backspace
bindkey '^B' vi-backward-word
bindkey '^W' vi-forward-word
bindkey '^L' vi-forward-char
bindkey '^H' vi-backward-char
bindkey '^[h' vi-backward-delete-char
bindkey '^[l' vi-delete-char
bindkey '^[b' vi-backward-kill-word
