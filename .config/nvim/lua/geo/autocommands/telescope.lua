vim.api.nvim_create_augroup('telescope', { clear = true })
vim.api.nvim_create_autocmd('VimEnter', {
    group = 'telescope',
    callback = function()
        local arg = vim.fn.argv()[1]
        if vim.fn.isdirectory(arg) == 1 then
            require 'telescope.builtin'.find_files({
                cwd = arg
            })
        end
    end
})
