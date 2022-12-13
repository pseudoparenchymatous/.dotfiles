local cmp = require 'cmp'
local luasnip = require 'luasnip'
return {
    ['<C-Space>'] = cmp.mapping(
        cmp.mapping.complete(), { 'i', 'c' }),
    ['<CR>'] = cmp.mapping({
        i = cmp.mapping.confirm({ select = true }),
        c = cmp.mapping.confirm({ select = false })
    }),
    ['<C-e>'] = cmp.mapping(function(fallback)
        if cmp.visible() then
            cmp.abort()
        else
            fallback()
        end
    end, { 'i', 'c' }),
    ['<C-n>'] = cmp.mapping(function(fallback)
        if cmp.visible() then
            cmp.select_next_item()
        else
            fallback()
        end
    end, { 'i', 'c' }),
    ['<C-p>'] = cmp.mapping(function(fallback)
        if cmp.visible() then
            cmp.select_prev_item()
        else
            fallback()
        end
    end, { 'i', 'c' }),
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
        else
            fallback()
        end
    end, { 'i', 'c' }),
    ['<C-d>'] = cmp.mapping(function(fallback)
        if cmp.visible() then
            cmp.scroll_docs(1)
        else
            fallback()
        end
    end),
    ['<C-u>'] = cmp.mapping(function(fallback)
        if cmp.visible() then
            cmp.scroll_docs(-1)
        else
            fallback()
        end
    end),
    ['<C-l>'] = cmp.mapping(function(fallback)
        if luasnip.expand_or_locally_jumpable() then
            luasnip.expand_or_jump()
        else
            fallback()
        end
    end, { 'i', 's' }),
    ['<C-h>'] = cmp.mapping(function(fallback)
        if luasnip.jumpable(-1) then
            luasnip.jump(-1)
        else
            fallback()
        end
    end, { 'i', 's' }),
}
