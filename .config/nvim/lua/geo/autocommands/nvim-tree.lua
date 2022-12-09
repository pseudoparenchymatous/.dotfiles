return function(bufnr)
   vim.api.nvim_create_augroup('nvim_tree', { clear = true })
   vim.api.nvim_create_autocmd('DirChanged', {
      group = 'nvim_tree',
      buffer = bufnr,
      command = 'cd <afile>',
   })
end
