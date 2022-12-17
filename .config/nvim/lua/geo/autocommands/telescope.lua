vim.api.nvim_create_augroup('telescope', { clear = true })
vim.api.nvim_create_autocmd('VimEnter', {
    group = 'telescope',
    callback = function()
        if vim.fn.isdirectory(vim.fn.argv()[1]) then
            require 'telescope.builtin'.find_files({
                cwd = vim.fn.argv()[1]
            })
        end
    end
})
