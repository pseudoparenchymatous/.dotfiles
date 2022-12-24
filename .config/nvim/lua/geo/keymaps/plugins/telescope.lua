local picker = require 'telescope.builtin'
local map = vim.keymap.set

map('n', '<Leader>tf', picker.find_files)
map('n', '<Leader>tg', picker.live_grep)
map('n', '<Leader>tp', picker.builtin)

local act = require 'telescope.actions'
return {
    i = {
        ["<Tab>"] = 'move_selection_worse',
        ["<C-Space>"] = 'toggle_selection',
    }
}
