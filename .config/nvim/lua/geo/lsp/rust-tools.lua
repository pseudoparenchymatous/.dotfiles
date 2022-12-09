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
         vim.keymap.set('n', '<S-K>',
            rt.hover_actions.hover_actions, { buffer = bufnr })
         vim.keymap.set('n', 'ga',
            rt.code_action_group.code_action_group, { buffer = bufnr })

         vim.keymap.set('n', 'gn', vim.diagnostic.goto_next, { buffer = bufnr })
         vim.keymap.set('n', 'gp', vim.diagnostic.goto_prev, { buffer = bufnr })
         vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {buffer = bufnr})
         vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, {buffer = bufnr})
         vim.keymap.set('n', 'gI', vim.lsp.buf.implementation, {buffer = bufnr})
         vim.keymap.set('n', '<Leader>D', vim.lsp.buf.type_definition, {buffer = bufnr})
         vim.keymap.set('n', '<Leader>r', vim.lsp.buf.rename, {buffer = bufnr})
         vim.keymap.set('n', '<Leader>f', vim.lsp.buf.format, {buffer = bufnr})
         vim.keymap.set('n', '<Leader>R', vim.lsp.buf.references, {buffer = bufnr})
      end,
   },
})
