source aliases.nu
source keybinds.nu

let-env config = ($env.config | upsert show_banner false)
let-env config = ($env.config | upsert filesize_metric true)
let-env config = ($env.config | upsert edit_mode vi)

source my-prompt.nu
