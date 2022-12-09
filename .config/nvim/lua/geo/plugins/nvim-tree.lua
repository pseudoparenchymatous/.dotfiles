require 'nvim-tree'.setup {
   disable_netrw = true,
   remove_keymaps = true,
   hijack_cursor = true,
   create_in_closed_folder = true,
   notify = {
      threshold = vim.log.levels.WARN,
   },
   view = {
      hide_root_folder = true,
      side = 'right',
   },
   on_attach = function(bufnr)
      require 'geo.keymaps.plugins.nvim-tree' (bufnr)
      require 'geo.autocommands.nvim-tree' (bufnr)
   end,
   renderer = {
      indent_markers = {
         enable = true,
      },
      icons = {
         show = {
            folder_arrow = false,
         }
      }
   }
}
