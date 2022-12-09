return function(bufnr)
	local bufopts = { silent = true, buffer = bufnr }
   local floatopts = { border = 'solid' }

	vim.keymap.set('n', '<Leader>e', function()
      vim.diagnostic.open_float(floatopts)
	end, bufopts)

	vim.keymap.set('n', 'gn', function()
      vim.diagnostic.goto_next({ float = floatopts })
	end, bufopts)

	vim.keymap.set('n', 'gp', function()
      vim.diagnostic.goto_prev({ float = floatopts })
	end, bufopts)

	vim.keymap.set('n', '<S-K>', vim.lsp.buf.hover, bufopts)
	vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
	vim.keymap.set('n', 'gTd', vim.lsp.buf.type_definition, bufopts)
	vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
	vim.keymap.set('n', 'gI', vim.lsp.buf.implementation, bufopts)
	vim.keymap.set('n', '<Leader>r', vim.lsp.buf.rename, bufopts)
	vim.keymap.set('n', '<Leader>a', vim.lsp.buf.code_action, bufopts)
	vim.keymap.set('n', '<Leader>R', vim.lsp.buf.references, bufopts)
	vim.keymap.set('n', '<Leader>f', vim.lsp.buf.format, bufopts)
end
