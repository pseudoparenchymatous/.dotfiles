require 'lspconfig'.sumneko_lua.setup {
    capabilities = require 'geo.lsp.cmp',
    on_attach = function(_, bufnr)
        require 'geo.keymaps.plugins.lsp' (bufnr)
    end,
    settings = {
        Lua = {
            runtime = {
                version = 'LuaJIT'
            },
            diagnostics = {
                globals = { 'vim' }
            },
            hint = {
                enable = true,
                setType = true
            },
            workspace = {
                -- library = vim.api.nvim_get_runtime_file('', true),
                library = vim.split(
                    vim.fn.glob(
                        '~/.local/share/nvim/site/pack/packer/start/*'
                    ),
                    '\n'
                )
            },
            telemetry = {
                enable = false
            },
        },
    },
}
