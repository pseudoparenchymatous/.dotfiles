return function(bufnr)
   local mapkey = vim.keymap.set
   local nt = require 'nvim-tree.api'

   mapkey('n', '<CR>', '<Nop>', { buffer = bufnr })
   mapkey('n', '<BS>', '<Nop>', { buffer = bufnr })
   mapkey('n', 'h', nt.node.navigate.parent_close, { buffer = bufnr })
   mapkey('n', '<S-h>', nt.tree.change_root_to_parent, { buffer = bufnr })
   mapkey('n', '<A-l>', nt.tree.change_root_to_node, { buffer = bufnr })
   mapkey('n', 'l', nt.node.open.edit, { buffer = bufnr })
   mapkey('n', '<S-l>', nt.node.open.vertical, { buffer = bufnr })
   mapkey('n', '<C-l>', nt.node.open.horizontal, { buffer = bufnr })
   mapkey('n', 'c', nt.fs.copy.node, { buffer = bufnr })
   mapkey('n', '<S-c>', nt.fs.cut, { buffer = bufnr })
   mapkey('n', 'p', nt.fs.paste, { buffer = bufnr })
   mapkey('n', 'r', nt.fs.rename, { buffer = bufnr })
   mapkey('n', 'n', nt.fs.create, { buffer = bufnr })
   mapkey('n', '<S-d>', nt.fs.remove, { buffer = bufnr })
   mapkey('n', 'f', nt.tree.search_node, { buffer = bufnr })
   mapkey('n', 'q', nt.tree.close, { buffer = bufnr })
   mapkey('n', '<Leader>e', nt.tree.toggle)
end
