alias nv = nvim
alias nvrc = nvim ~/.config/nvim
alias dui = gitui --directory ~/.dotbare --workdir ~
alias dotf = git --git-dir ~/.dotbare --work-tree ~
alias upd = nala update
alias upg = nala upgrade
alias zj = zellij
alias i = nala install
alias la = ls -a
alias ll = ls -al

def-env nu-ssh [] {
    ssh-agent -c | lines | first 2 | parse "setenv {name} {value};" | transpose -i -r -d | load-env
}


let carapace_completer = {|spans|
    carapace $spans.0 nushell $spans | from json
}

let-env config = {
    show_banner: false
    cursor_shape: {
        emacs: block
    }
    table: {
        mode: heavy
    }
    completions: {
        external: {
            enable: true
            completer: $carapace_completer
        }
    }
}

source ~/.config/nushell/starship.nu
