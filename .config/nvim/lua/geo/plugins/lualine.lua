local function lsp_name()
   return vim.lsp.get_active_clients({ bufnr = 0 })[1].name
end
require 'lualine'.setup {
   options = {
      globalstatus = true,
      always_divide_middle = false,
      section_separators = { right = '', left = '' },
   },
   sections = {
      lualine_a = { { 'mode', padding = 0, fmt = function() return ' ' end, } },
      lualine_b = { 'branch', 'diff' },
      lualine_c = {
         { 'diagnostics', separator = '', padding = { right = 0, left = 1 } },
         { lsp_name, separator = '' },
      },
      lualine_x = { 'filetype' },
   },
   extensions = {
      'nvim-tree',
   },
}

