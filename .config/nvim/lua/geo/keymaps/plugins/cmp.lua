local cmp = require 'cmp'
local luasnip = require 'luasnip'
return {
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
}
