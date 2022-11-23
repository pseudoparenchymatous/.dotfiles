vim.api.nvim_create_augroup('packer_user_config', { clear = true })
vim.api.nvim_create_autocmd('BufWritePost', {
   group = 'packer_user_config',
   pattern = 'plugins.lua',
   command = 'source <afile> | PackerCompile'
})

vim.api.nvim_create_augroup('cursor_blink', { clear = true })
vim.api.nvim_create_autocmd({ 'InsertEnter', 'CmdlineEnter' }, {
   group = 'cursor_blink',
   pattern = '*',
   command = 'silent !sed -i "54s/=.*/= 650/" ~/.termux/termux.properties && \z
      termux-reload-settings&',
})
vim.api.nvim_create_autocmd({ 'InsertLeavePre', 'CmdlineLeave' }, {
   group = 'cursor_blink',
   pattern = '*',
   command = 'silent !sed -i "54s/=.*/= 0/" ~/.termux/termux.properties && \z
      termux-reload-settings&',
})

