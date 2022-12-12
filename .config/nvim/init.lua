-- Disable builtin plugins
vim.g.loaded_netrw            = 1
vim.g.loaded_netrwPlugin      = 1
vim.g.loaded_gzip             = 1
vim.g.loaded_matchparen       = 1
vim.g.loaded_spellfile_plugin = 1
vim.g.loaded_tarPlugin        = 1
vim.g.loaded_tar              = 1
vim.g.loaded_vimballPlugin    = 1
vim.g.loaded_vimball          = 1
vim.g.loaded_zipPlugin        = 1
vim.g.loaded_zip              = 1
vim.g.loaded_2html_plugin     = 1

require 'geo.autocommands'
require 'geo.keymaps'
require 'geo.options'
require 'geo.plugins'
require 'geo.colorschemes'
require 'geo.usercommands'
