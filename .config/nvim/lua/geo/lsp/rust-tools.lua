local rt = require("rust-tools")

rt.setup({
   tools = {
      inlay_hints = {
         only_current_line = true,
      },
      hover_actions = {
         border = 'solid',
      },
   },
   server = {
      on_attach = function(_, bufnr)
         vim.keymap.set('n', '<Leader>ge',
            rt.hover_actions.hover_actions, { buffer = bufnr })
         vim.keymap.set('n', '<Leader>ga',
            rt.code_action_group.code_action_group, { buffer = bufnr })

         vim.keymap.set('n', '<Leader>gn', vim.diagnostic.goto_next, { buffer = bufnr })
         vim.keymap.set('n', '<Leader>gp', vim.diagnostic.goto_prev, { buffer = bufnr })
         vim.keymap.set('n', '<S-K>', vim.lsp.buf.hover, { buffer = bufnr })
         vim.keymap.set('n', '<Leader>gd', vim.lsp.buf.declaration, {buffer = bufnr})
         vim.keymap.set('n', '<Leader>gD', vim.lsp.buf.definition, {buffer = bufnr})
         vim.keymap.set('n', '<Leader>gI', vim.lsp.buf.implementation, {buffer = bufnr})
         vim.keymap.set('n', '<Leader>D', vim.lsp.buf.type_definition, {buffer = bufnr})
         vim.keymap.set('n', '<Leader>gr', vim.lsp.buf.rename, {buffer = bufnr})
         vim.keymap.set('n', '<Leader>gf', vim.lsp.buf.format, {buffer = bufnr})
         vim.keymap.set('n', '<Leader>gR', vim.lsp.buf.references, {buffer = bufnr})
      end,
   },
})
