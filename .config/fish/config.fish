if status is-interactive
    # Commands to run in interactive sessions can go here
    starship init fish | source

    abbr --add nv nvim
    abbr --add nvrc 'nvim ~/.dotfiles/.config/nvim'
    abbr --add zj zellij
    abbr --add upd nala update
    abbr --add upg nala upgrade
    abbr --add i nala install

    alias ls "ls --group-directories-first"
    abbr --add la ls -A
    abbr --add ll la -Ggh
end
