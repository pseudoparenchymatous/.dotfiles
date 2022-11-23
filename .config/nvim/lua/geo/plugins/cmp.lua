-- local has_words_before = function()
--    local line, col = unpack( vim.api.nvim_win_get_cursor(0) )
--    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
-- end

local kind_icons = {
   Text = "",
   Method = "",
   Function = "",
   Constructor = "",
   Field = "",
   Variable = "",
   Class = "ﴯ",
   Interface = "",
   Module = "",
   Property = "ﰠ",
   Unit = "",
   Value = "",
   Enum = "",
   Keyword = "",
   Snippet = "",
   Color = "",
   File = "",
   Reference = "",
   Folder = "",
   EnumMember = "",
   Constant = "",
   Struct = "",
   Event = "",
   Operator = "",
   TypeParameter = "",
}

require 'luasnip.loaders.from_vscode'.lazy_load()
local cmp = require 'cmp'
local luasnip = require 'luasnip'
cmp.setup {
   enabled = function()
      -- disable completion in comments
      local context = require 'cmp.config.context'
      -- keep command mode completion enabled when cursor is in a comment
      if vim.api.nvim_get_mode().mode == 'c' then
         return true
      else
         return not context.in_treesitter_capture("comment")
             and not context.in_syntax_group("Comment")
      end
   end,
   snippet = {
      -- REQUIRED: snippet engine
      expand = function(args)
         luasnip.lsp_expand(args.body)
      end,
   },
   preselect = cmp.PreselectMode.Item,
   mapping = {
      ["<C-k>"] = cmp.mapping(function(fallback)
         if cmp.visible() then
            cmp.select_prev_item()
         else
            fallback()
         end
      end, { 'i', 'c' }),
      ["<C-j>"] = cmp.mapping(function(fallback)
         if cmp.visible() then
            cmp.select_next_item()
         else
            fallback()
         end
      end, { 'i', 'c' }),
      ['<C-b>'] = cmp.mapping(function(fallback)
         if cmp.visible() then
            cmp.scroll_docs(-1)
         else
            fallback()
         end
      end, { 'i', 'c' }),
      ['<C-f>'] = cmp.mapping(function(fallback)
         if cmp.visible() then
            cmp.scroll_docs(1)
         else
            fallback()
         end
      end, { 'i', 'c' }),
      ['<C-Space>'] = cmp.mapping(
         cmp.mapping.complete(), { 'i', 'c' }),
      ['<C-e>'] = cmp.mapping(function(fallback)
         if cmp.visible() then
            cmp.abort()
         else
            fallback()
         end
      end, { 'i', 'c' }),
      ['<CR>'] = cmp.mapping(
         cmp.mapping.confirm({ select = false }), { 'i', 'c' }),
      ['<C-l>'] = cmp.mapping(function(fallback)
         if luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
         else
            fallback()
         end
      end, { 'i' }),
      ['<C-h>'] = cmp.mapping(function(fallback)
         if luasnip.jumpable(-1) then
            luasnip.jump(-1)
         else
            fallback()
         end
      end, { 'i' }),
      ['<Tab>'] = cmp.mapping(function(fallback)
         if cmp.visible() then
            cmp.select_next_item()
         else
            fallback()
         end
      end, { 'i', 'c' }),
      ['<S-Tab>'] = cmp.mapping(function(fallback)
         if cmp.visible() then
            cmp.select_prev_item()
         elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
         else
            fallback()
         end
      end, { 'i', 'c' }),
   },


   sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'luasnip' },
   }, {
      { name = 'nvim_lua' },
      { name = 'path' },
   }, {
      { name = 'buffer' },
   }),
   view = {
      entries = {
         selection_order = 'near_cursor',
      },
   },
   window = {
      completion = {
         scrolloff = 2
      }
   },
   experimental = {
      ghost_text = true,
      native_menu = false,
   },
   formatting = {
      fields = { "kind", "abbr", "menu" },
      format = function(entry, vim_item)
         vim_item.kind = string.format('%s', kind_icons[vim_item.kind])
         vim_item.menu = ({
            nvim_lsp = "[LSP]",
            luasnip = "[LuaSnip]",
            nvim_lua = "[NvimLua]",
            path = "[Path]",
            cmdline = "[CMD]",
            buffer = "[Buffer]",
         })[entry.source.name]
         return vim_item
      end
   },
}

cmp.event:on('confirm_done', require 'nvim-autopairs.completion.cmp'.on_confirm_done())

cmp.setup.cmdline({ '/', '?' }, {
   sources = {
      { name = 'buffer' }
   }
})

cmp.setup.cmdline(':', {
   sources = cmp.config.sources({
      { name = 'cmdline' },
   }, {
      { name = 'path' }
   })
})
