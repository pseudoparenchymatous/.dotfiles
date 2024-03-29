let-env PATH = ($env.PATH | split row (char esep) | prepend $"($env.HOME)/.local/share/cargo/bin")
let-env NU_LIB_DIRS = [
    ($nu.config-path | path dirname | path join 'scripts')
]

load-env {
    VISUAL               : nvim
    EDITOR               : nvim
    GOPATH               : ("~/.local/share/go" | path expand)
    BAT_THEME            : gruvbox-dark
    CARGO_HOME           : ("~/.local/share/cargo" | path expand)
    NODE_REPL_HISTORY    : ("~/.local/share/node_repl_history" | path expand)
    NPM_CONFIG_USERCONFIG: ("~/.config/npm/npmrc" | path expand)
    XDG_CONFIG_HOME      : ("~/.config" | path expand)
    XDG_CACHE_HOME       : ("~/.cache" | path expand)
    XDG_DATA_HOME        : ("~/.local/share" | path expand)
    XDG_STATE_HOME       : ("~/.local/state" | path expand)
}
