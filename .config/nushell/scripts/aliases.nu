alias la = (ls -a | sort-by type)
alias ll = (ls -al | sort-by type | select name type target readonly mode size accessed modified)

alias cl = clear

alias nv = nvim
alias nvrc = nv ~/.config/nvim/
alias nurc = nv ~/.config/nushell/

alias sysup = nala upgrade
