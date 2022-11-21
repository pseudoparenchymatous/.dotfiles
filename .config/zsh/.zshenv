export XDG_DATA_HOME="${HOME}/.local/share"
export XDG_CONFIG_HOME="${HOME}/.config"
export XDG_STATE_HOME="${HOME}/.local/state"
export XDG_CACHE_HOME="${HOME}/.cache"
# export XDG_RUNTIME_DIR=/run/user/$UID

source "${ZDOTDIR}/ls_colors.zsh"

export HISTFILE="${XDG_DATA_HOME}/zsh/.history"

export VISUAL=nvim
export EDITOR=nvim

export MANPAGER='nvim +Man!'
export MANWIDTH=999

typeset -U path PATH
path=($HOME/.local/bin $path)
export PATH

path=($XDG_DATA_HOME/npm/bin $path)
export NPM_CONFIG_USERCONFIG="${XDG_CONFIG_HOME}/npm/npmrc"
export NODE_REPL_HISTORY="${XDG_DATA_HOME}/node_repl_history"

export PYTHONSTARTUP="${PREFIX}/etc/python/pythonrc"

export GOPATH="${XDG_DATA_HOME}/go"
path=($path $GOPATH/bin)

export CARGO_HOME="${XDG_DATA_HOME}/cargo"

export ZPLUGS="${XDG_DATA_HOME}/zsh/plugins"
