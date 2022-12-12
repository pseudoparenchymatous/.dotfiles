-- Disable builtin plugins
vim.g.loaded_netrwPlugin      = 1
vim.g.loaded_tarPlugin        = 1
vim.g.loaded_zipPlugin        = 1
vim.g.loaded_2html_plugin     = 1

require 'geo.autocommands'
require 'geo.keymaps'
require 'geo.options'
require 'geo.plugins'
require 'geo.colorschemes'
require 'geo.usercommands'
