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
            -- workspace = {
            --     library = vim.api.nvim_get_runtime_file('', true),
            -- },
            telemetry = {
                enable = false
            },
        },
    },
}
