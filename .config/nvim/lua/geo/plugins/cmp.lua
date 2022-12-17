-- local has_words_before = function()
--    local line, col = unpack( vim.api.nvim_win_get_cursor(0) )
--    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
-- end

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
    mapping = require 'geo.keymaps.plugins.cmp',
    sources = cmp.config.sources({
        { name = 'luasnip' },
        { name = 'nvim_lsp' },
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
            vim_item.kind = string.format(
                '%s', require 'geo.icons'[vim_item.kind])
            vim_item.abbr = string.sub(vim_item.abbr, 1, 20)
            vim_item.menu = ({
                nvim_lsp = "[LSP]",
                luasnip = "[SNIP]",
                nvim_lua = "[NVIM]",
                path = "[PATH]",
                cmdline = "[CMD]",
                buffer = "[BUF]",
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
