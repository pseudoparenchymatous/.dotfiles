require 'geo.autocommands.telescope'


require 'telescope'.setup {
    defaults = {
        prompt_prefix = '  ',
        selection_caret = '  ',
        multi_icon = '+ ',
        entry_prefix = '   ',
        mappings = require 'geo.keymaps.plugins.telescope',
    }
}
