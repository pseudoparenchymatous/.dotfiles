require 'mason'.setup {
   ui = {
      icons = {
         package_installed = '',
         package_pending = '',
         package_uninstalled = 'ﮊ',
      },
      border = 'single',
   },
   PATH = 'append',
}

local cmp_cap = require 'cmp_nvim_lsp'.default_capabilities(
   vim.lsp.protocol.make_client_capabilities())

local on_attach = function(_, bufnr)
   local bufopts = { silent = true, buffer = bufnr }
   vim.keymap.set('n', '<Leader>ge', vim.diagnostic.open_float, bufopts)
   vim.keymap.set('n', '<Leader>gn', vim.diagnostic.goto_next, bufopts)
   vim.keymap.set('n', '<Leader>gp', vim.diagnostic.goto_prev, bufopts)
   vim.keymap.set('n', '<S-K>', vim.lsp.buf.hover, bufopts)
   vim.keymap.set('n', '<Leader>gd', vim.lsp.buf.declaration, bufopts)
   vim.keymap.set('n', '<Leader>gD', vim.lsp.buf.definition, bufopts)
   vim.keymap.set('n', '<Leader>gI', vim.lsp.buf.implementation, bufopts)
   vim.keymap.set('n', '<Leader>D', vim.lsp.buf.type_definition, bufopts)
   vim.keymap.set('n', '<Leader>gr', vim.lsp.buf.rename, bufopts)
   vim.keymap.set('n', '<Leader>ga', vim.lsp.buf.code_action, bufopts)
   vim.keymap.set('n', '<Leader>gR', vim.lsp.buf.references, bufopts)
   vim.keymap.set('n', '<Leader>gf', vim.lsp.buf.format, bufopts)
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
            library = vim.api.nvim_get_runtime_file("", true),
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

require 'lspconfig.ui.windows'.default_options.border = 'single'
