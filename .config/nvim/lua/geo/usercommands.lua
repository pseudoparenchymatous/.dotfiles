vim.api.nvim_create_user_command(
    'Scratch',
    function(opts)
        vim.cmd.redir('@z')
        vim.cmd('silent ' .. opts.args)
        vim.cmd.redir('END')

        vim.cmd('new | setl bt=nofile bh=wipe wrap nobl')
        vim.cmd('put z')
    end,
    {
        desc = 'Print command output in a scratch buffer',
        nargs = '*',
    }
)
