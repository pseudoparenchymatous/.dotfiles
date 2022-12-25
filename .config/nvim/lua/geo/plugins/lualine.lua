local function lsp_name()
    return vim.lsp.get_active_clients({ bufnr = 0 })[1].name
end

local function is_buf_modified()
    if vim.api.nvim_get_option_value('modified', {}) then
        return '[+]'
    else
        return ''
    end
end

require 'geo.keymaps.plugins.lualine'
require 'lualine'.setup {
    options = {
        globalstatus = true,
        always_divide_middle = false,
        section_separators = { right = '', left = '' },
    },
    sections = {
        lualine_a = { { 'mode', padding = 0, fmt = function() return ' ' end, } },
        lualine_b = { { 'branch', icon = '' } },
        lualine_c = {
            { 'diagnostics', separator = '', padding = { right = 0, left = 1 } },
            { lsp_name, separator = '' }
        },
        lualine_x = {
            { is_buf_modified, separator = '', },
        },
        lualine_y = { 'filetype' },
        lualine_z = { 'progress' },
    },
    extensions = {
        'nvim-tree',
    },
}
