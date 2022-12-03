vim.api.nvim_create_augroup('packer_user_config', { clear = true })
vim.api.nvim_create_autocmd('BufWritePost', {
   group = 'packer_user_config',
   pattern = '*/plugins/init.lua',
   command = 'source <afile> | PackerCompile'
})

vim.api.nvim_create_augroup('CursorLine', { clear = true })
vim.api.nvim_create_autocmd({ 'VimEnter', 'WinEnter', 'BufWinEnter' }, {
   group = 'CursorLine',
   pattern = '*',
   command = 'setlocal cursorline'
})
vim.api.nvim_create_autocmd('WinLeave', {
   group = 'CursorLine',
   pattern = '*',
   command = 'setlocal nocursorline'
})
vim.api.nvim_create_augroup('ch_cwd', { clear = true })
vim.api.nvim_create_autocmd('BufEnter',{
   group = 'ch_cwd',
   pattern = '*',
   command = 'silent! lcd %:p:h',
})
-- vim.api.nvim_create_augroup('cursor_blink', { clear = true })
-- vim.api.nvim_create_autocmd({ 'InsertEnter', 'CmdlineEnter' }, {
--    group = 'cursor_blink',
--    pattern = '*',
--    command = 'silent !sed -i "54s/=.*/= 650/" ~/.termux/termux.properties && \z
--       termux-reload-settings&',
-- })
-- vim.api.nvim_create_autocmd({ 'InsertLeavePre', 'CmdlineLeave' }, {
--    group = 'cursor_blink',
--    pattern = '*',
--    command = 'silent !sed -i "54s/=.*/= 0/" ~/.termux/termux.properties && \z
--       termux-reload-settings&',
-- })
-- vim.api.nvim_clear_autocmds{ group = 'cursor_blink' }
