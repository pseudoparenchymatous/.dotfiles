vim.keymap.set({'n', 'i'}, '<A-r>', function()
    local into = {
        location = 'progress',
        progress = 'location'
    }

    local from = require 'lualine'
        .get_config()
        .sections.lualine_z[1]

    require 'lualine'.setup {
        sections = {
            lualine_z = { into[from] }
        }
    }
end)
