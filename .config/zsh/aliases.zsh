alias sysup="nala upgrade"

# Directories first, with colors, listed horizontally
alias ls="ls -x --group-directories-first --color=auto"
alias la="ls -a"
# Long list with file size without group name
alias ll="la -hog"

alias cl="clear"

alias dotF="git --git-dir=${HOME}/.dotfiles/ --work-tree=${HOME}"

alias wget="wget --hsts-file=${XDG_DATA_HOME}/wget-hsts"

alias zrc="nvim $ZDOTDIR/"
alias nvrc="nvim $XDG_CONFIG_HOME/nvim/"

alias nv=nvim
alias tmux='tmux -2'

alias topen='termux-open'

mkcd () { mkdir -p -- $1 && cd -P -- $1 }
