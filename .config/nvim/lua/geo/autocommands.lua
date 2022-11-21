vim.api.nvim_create_augroup('cursor_blink', { clear = true })
vim.api.nvim_create_autocmd('InsertEnter', {
   group = 'cursor_blink',
   pattern = '*',
   command = 'silent !sed -i "54s/=.*/= 650/" ~/.termux/termux.properties && \\\
      termux-reload-settings&',
})
vim.api.nvim_create_autocmd('InsertLeavePre', {
   group = 'cursor_blink',
   pattern = '*',
   command = 'silent !sed -i "54s/=.*/= 0/" ~/.termux/termux.properties && \\\
      termux-reload-settings&',
})

