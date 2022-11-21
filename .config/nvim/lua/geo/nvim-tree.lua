local mapkey = vim.keymap.set
local nt = require 'nvim-tree.api'

require 'nvim-tree'.setup {
   disable_netrw = true,
   remove_keymaps = true,
   hijack_cursor = true,
   create_in_closed_folder = true,
   view = {
      hide_root_folder = true,
      side = 'right',
   },
   on_attach = function(bufnr)
      mapkey('n', '<CR>', '<Nop>', { buffer = bufnr })
      mapkey('n', '<BS>', '<Nop>', { buffer = bufnr })
      mapkey('n', 'h', nt.node.navigate.parent_close, { buffer = bufnr })
      mapkey('n', 'l', nt.node.open.edit, { buffer = bufnr })
      mapkey('n', '<S-l>', nt.node.open.vertical, { buffer = bufnr })
      mapkey('n', 'c', nt.fs.copy.node, { buffer = bufnr })
      mapkey('n', '<S-c>', nt.fs.cut, { buffer = bufnr })
      mapkey('n', 'p', nt.fs.paste, { buffer = bufnr })
      mapkey('n', 'r', nt.fs.rename_sub, { buffer = bufnr })
      mapkey('n', 'n', nt.fs.create, { buffer = bufnr })
      mapkey('n', 'd', nt.fs.remove, { buffer = bufnr })
      mapkey('n', 'f', nt.tree.search_node, { buffer = bufnr })
   end
}
