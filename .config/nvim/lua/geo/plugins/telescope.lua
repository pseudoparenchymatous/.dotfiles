require 'geo.autocommands.telescope'
require 'geo.keymaps.plugins.telescope'

require 'telescope'.setup {
    defaults = {
        prompt_prefix = '  ',
        selection_caret = '  ',
        multi_icon = '+ ',
        entry_prefix = '   ',
    }
}
