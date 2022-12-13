require 'mason'.setup {
    ui = {
        icons = {
            package_installed = '',
            package_pending = '',
            package_uninstalled = 'ﮊ',
        },
        border = 'solid',
    },
    PATH = 'append',
}

require 'mason-lspconfig'.setup()

local lspconfig = require 'lspconfig'

require 'mason-lspconfig'.setup_handlers {
    function(server_name) -- default handler
        lspconfig[server_name].setup {
            capabilities = require 'geo.lsp.cmp',
            on_attach = function(_, bufnr)
                require 'geo.keymaps.plugins.lsp' (bufnr)
            end
        }
    end
}
