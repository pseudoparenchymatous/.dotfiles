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

vim.api.nvim_create_augroup('packer_user_config', { clear = true })
vim.api.nvim_create_autocmd('BufWritePost', {
   group = 'packer_user_config',
   pattern = 'plugins.lua',
   command = 'source <afile> | PackerSync'
})

return require 'packer'.startup {
   function(use)
      use 'wbthomason/packer.nvim'

      use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' ,
         requires = {
            { 'nvim-treesitter/nvim-treesitter-context', },
            { 'nvim-treesitter/playground', },
            { 'p00f/nvim-ts-rainbow', },
         },
         config = function()
            return require 'geo.treesitter'
         end,
      }

      use { 'neovim/nvim-lspconfig',
         requires = {
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },
            { 'j-hui/fidget.nvim' },
         },
         config = function()
            return require 'geo.lsp'
         end,
      }

      use { 'jose-elias-alvarez/null-ls.nvim',
         config = function()
            return require 'geo.null-ls'
         end,
         requires = { 'nvim-lua/plenary.nvim' },
      }

      use { 'hrsh7th/nvim-cmp',
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
         config = function()
            return require 'geo.cmp'
         end,
      }

      use { 'mattn/emmet-vim',
         opt = true,
         ft = 'html',
         setup = function()
            return require 'geo.emmet'
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
            return require 'geo.comment'
         end,
      }

      use { 'nvim-tree/nvim-tree.lua',
         config = function()
            return require 'geo.nvim-tree'
         end,
         requires = {
            'nvim-tree/nvim-web-devicons',
            config = function()
               return require 'geo.devicons'
            end,
         },
      }

      use { 'nvim-lualine/lualine.nvim',
         config = function()
            return require 'geo.lualine'
         end,
      }

      use { 'windwp/nvim-autopairs',
         config = function()
            return require 'geo.autopairs'
         end,
      }

      use { 'lukas-reineke/indent-blankline.nvim',
         config = function()
            return require 'geo.indentline'
         end,
      }

      use { 'ethanholz/nvim-lastplace',
         config = function()
            return require 'geo.lastplace'
         end,
      }

      use { 'LhKipp/nvim-nu', run = ':TSInstall nu',
         config = function()
            return require 'geo.nu'
         end,
      }

      use 'folke/tokyonight.nvim'
      use 'sainnhe/edge'
      use 'Mofiqul/dracula.nvim'
      use 'ellisonleao/gruvbox.nvim'
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
