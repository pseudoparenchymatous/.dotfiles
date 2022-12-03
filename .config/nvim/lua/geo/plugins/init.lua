-- local ensure_packer = function()
--    local fn = vim.fn
--    local install_path = fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
--
--    if fn.empty( fn.glob ( install_path ) ) > 0 then
--       print 'Installing packer'
--       fn.system {
--          'git', 'clone',
--          '--depth', '1',
--          'git@github.com:wbthomason/packer.nvim', install_path
--       }
--
--       print 'Enabling packer'
--       vim.cmd 'packadd packer.nvim'
--       print 'Packer ready to be used'
--
--       return true
--    end
--
--    return false
-- end
--
-- local packer_bootstrap = ensure_packer()

return require 'packer'.startup {
   function(use)
      use 'wbthomason/packer.nvim'

      use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate',
         config = 'require "geo.treesitter"',
         requires = {
            { 'nvim-treesitter/playground',
               opt = true,
            },

            { 'nvim-treesitter/nvim-treesitter-context',
               opt = true,
               config = 'require "geo.treesitter.context"',
            },

            { 'p00f/nvim-ts-rainbow',
               config = 'require "geo.treesitter.rainbow"',
            },

            { 'nvim-treesitter/nvim-treesitter-textobjects',
               config = 'require "geo.treesitter.textobjects"',
            }
         },
      }

      use { 'neovim/nvim-lspconfig',
         config = 'require "geo.lsp"',
         requires = {
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },
            { 'j-hui/fidget.nvim' },
         },
      }

      use { 'simrat39/rust-tools.nvim',
         config = 'require "geo.lsp.rust-tools"',
         after = 'nvim-lspconfig',
         ft = 'rust',
      }

      use { 'jose-elias-alvarez/null-ls.nvim',
         opt = true,
         config = 'require "geo.plugins.null-ls"',
         requires = 'nvim-lua/plenary.nvim',
      }

      use { 'hrsh7th/nvim-cmp',
         config = 'require "geo.plugins.cmp"',
         requires = {
            { 'L3MON4D3/LuaSnip', requires = 'saadparwaiz1/cmp_luasnip' },
            {
               'hrsh7th/cmp-path',
               'hrsh7th/cmp-cmdline',
               'hrsh7th/cmp-nvim-lsp',
               'hrsh7th/cmp-buffer',
               'rafamadriz/friendly-snippets',
               'hrsh7th/cmp-nvim-lua',
            },
         },
      }

      use { 'kylechui/nvim-surround',
         config = 'require "geo.plugins.nvim-surround"',
      }

      use { 'utilyre/barbecue.nvim',
         config = 'require "geo.plugins.barbecue"',
         requires = 'SmiteshP/nvim-navic',
      }

      use { 'mattn/emmet-vim',
         ft = 'html',
         cmd = 'EmmetInstall',
         setup = 'require "geo.plugins.emmet"',
         config = function()
            vim.api.nvim_create_autocmd('FileType', {
               pattern = 'html',
               command = 'EmmetInstall',
            })
         end
      }

      use { 'numToStr/Comment.nvim',
         config = 'require "geo.plugins.comment"',
      }

      use { 'nvim-tree/nvim-tree.lua',
         config = 'require "geo.plugins.nvim-tree"',
         requires = {
            'nvim-tree/nvim-web-devicons',
            config = 'require "geo.plugins.devicons"',
         },
      }

      use { 'nvim-lualine/lualine.nvim',
         config = 'require "geo.plugins.lualine"',
      }

      use { 'windwp/nvim-autopairs',
         config = 'require "geo.plugins.autopairs"',
      }

      use { 'lukas-reineke/indent-blankline.nvim',
         config = 'require "geo.plugins.indentline"',
      }

      use { 'ethanholz/nvim-lastplace',
         config = 'require "geo.plugins.lastplace"',
      }

      use { 'LhKipp/nvim-nu',
         ft = 'nu',
         requires = 'jose-elias-alvarez/null-ls.nvim',
         config = 'require "geo.plugins.nu"',
      }

      use { 'folke/tokyonight.nvim', opt = true, }
      use { 'sainnhe/edge', opt = true, }
      use { 'Mofiqul/dracula.nvim', opt = true, }
      use { 'ellisonleao/gruvbox.nvim', opt = true, }
      use 'sainnhe/gruvbox-material'

      -- if packer_bootstrap then
      --    require 'packer'.sync()
      -- end
   end,

   config = {
      display = {
         open_fn = function()
            return require 'packer.util'
                .float { border = 'solid' }
         end
      }
   }
}
