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

local cmp_cap = require 'cmp_nvim_lsp'.default_capabilities(
   vim.lsp.protocol.make_client_capabilities())

local on_attach = function(_, bufnr)
   require 'geo.keymaps.plugins.lsp'(bufnr)
end

require 'mason-lspconfig'.setup()

local lspconfig = require 'lspconfig'

require 'mason-lspconfig'.setup_handlers {
   function(server_name) -- default handler
      lspconfig[server_name].setup {
         capabilities = cmp_cap,
         on_attach = on_attach,
      }
   end,
}

lspconfig.sumneko_lua.setup {
   capabilities = cmp_cap,
   on_attach = on_attach,
   settings = {
      Lua = {
         runtime = {
            version = 'LuaJIT',
         },
         diagnostics = {
            globals = { 'vim' },
         },
         workspace = {
            library = vim.api.nvim_get_runtime_file('', true),
         },
         telemetry = {
            enable = false,
         },
      },
   },
}

-- lspconfig.rust_analyzer.setup {
--    on_attach = on_attach,
--    capabilities = cmp_cap,
-- }
