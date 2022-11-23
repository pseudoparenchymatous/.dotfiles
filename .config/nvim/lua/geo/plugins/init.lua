--[[
local ensure_packer = function()
   local fn = vim.fn
   local install_path = fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'

   if fn.empty( fn.glob ( install_path ) ) > 0 then
      print 'Installing packer'
      fn.system {
         'git', 'clone',
         '--depth', '1',
         'git@github.com:wbthomason/packer.nvim', install_path
      }

      print 'Enabling packer'
      vim.cmd 'packadd packer.nvim'
      print 'Packer ready to be used'

      return true
   end

   return false
end

local packer_bootstrap = ensure_packer()
]]

return require 'packer'.startup {
   function(use)
      use 'wbthomason/packer.nvim'

      use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' ,
         -- config = 'return require "geo.treesitter"',
         -- config = function()
         --    return require 'geo.treesitter'
         -- end,

         requires = {
            { 'nvim-treesitter/playground',
               opt = true,
            },

            { 'nvim-treesitter/nvim-treesitter-context',
               opt = true,
               config = function()
                  return require 'geo.treesitter.context'
               end,
            },

            { 'p00f/nvim-ts-rainbow',
               config = function()
                  return require 'geo.treesitter.rainbow'
               end,
            },

            { 'nvim-treesitter/nvim-treesitter-textobjects',
               config = function()
                  return require 'geo.treesitter.textobjects'
               end,
            }
         },
      }

      use { 'kylechui/nvim-surround',
         config = function()
            return require 'geo.plugins.nvim-surround'
         end,
      }

      use { 'neovim/nvim-lspconfig',
         config = function()
            return require 'geo.lsp'
         end,

         requires = {
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },
            { 'j-hui/fidget.nvim' },
            { 'SmiteshP/nvim-navic' },
         },
      }

      use { 'jose-elias-alvarez/null-ls.nvim',
         config = function()
            return require 'geo.plugins.null-ls'
         end,
         requires = { 'nvim-lua/plenary.nvim' },
      }

      use { 'hrsh7th/nvim-cmp',
         config = function()
            return require 'geo.plugins.cmp'
         end,

         requires = {
            { 'L3MON4D3/LuaSnip', requires = { 'saadparwaiz1/cmp_luasnip' } },
            {
               'hrsh7th/cmp-path',
               "hrsh7th/cmp-cmdline",
               'hrsh7th/cmp-nvim-lsp',
               'hrsh7th/cmp-buffer',
               'rafamadriz/friendly-snippets',
               'hrsh7th/cmp-nvim-lua',
            },
         },
      }

      use { 'mattn/emmet-vim',
         ft = 'html',
         cmd = 'EmmetInstall',
         setup = function()
            return require 'geo.plugins.emmet'
         end,
         config = function()
            vim.api.nvim_create_autocmd('FileType', {
               pattern = 'html',
               command = 'EmmetInstall',
            })
         end
      }

      use { 'numToStr/Comment.nvim',
         config = function()
            return require 'geo.plugins.comment'
         end,
      }

      use { 'nvim-tree/nvim-tree.lua',
         config = 'require "geo.plugins.nvim-tree"',
         -- config = function()
         --    print 'tree'
         --    return require 'geo.nvim-tree'
         -- end,
         requires = {
            'nvim-tree/nvim-web-devicons',
            config = function()
               return require 'geo.plugins.devicons'
            end,
         },
      }

      use { 'nvim-lualine/lualine.nvim',
         config = function()
            return require 'geo.plugins.lualine'
         end,
      }

      use { 'windwp/nvim-autopairs',
         config = function()
            return require 'geo.plugins.autopairs'
         end,
      }

      use { 'lukas-reineke/indent-blankline.nvim',
         config = function()
            return require 'geo.plugins.indentline'
         end,
      }

      use { 'ethanholz/nvim-lastplace',
         config = function()
            return require 'geo.plugins.lastplace'
         end,
      }

      use { 'LhKipp/nvim-nu', run = ':TSInstall nu',
         config = function()
            return require 'geo.plugins.nu'
         end,
      }

      use { 'folke/tokyonight.nvim',
         -- cmd = {
         --    'colo tokyonight',
         --    'colorscheme tokyonight'
         -- },
         -- setup = function()
         --    return require 'tokyonight'
         -- end
      }
      use { 'sainnhe/edge', }
      use { 'Mofiqul/dracula.nvim', }
      use { 'ellisonleao/gruvbox.nvim', }
      use 'sainnhe/gruvbox-material'

      --[[if packer_bootstrap then
         require 'packer'.sync()
      end]]
   end,

   config = {
      display = {
         open_fn = function()
            return require 'packer.util'
               .float { border = 'single' }
         end
      }
   }
}
