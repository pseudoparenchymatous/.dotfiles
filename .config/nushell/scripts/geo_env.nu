let-env PATH = ($env.PATH | prepend '~/.local/bin/')

let-env NURC_DIR = ($nu.config-path | path dirname)

let-env VISUAL = 'nvim'
let-env EDITOR = 'nvim'

let-env LS_COLORS = (vivid generate gruvbox-dark | str trim)
