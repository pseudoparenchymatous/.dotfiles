local set = vim.opt
local my_options = {
   compatible = false,
   smartcase = true,
   ignorecase = true,
   tagcase = 'smart',
   scrolloff = 5,
   sidescrolloff = 12,
   wrap = false,
   linebreak = true, -- this option is enabled if wrap is enabled
   breakindent = true, -- indent wrapped lines
   showbreak = '~> ', -- prepend this to wrapped lines
   cpoptions = set.cpoptions + 'n', -- use number col. to indicate wrap
   number = true,
   relativenumber = true,
   hlsearch = false,
   termguicolors = true,
   guicursor = { 'i:block' },
   splitbelow = true,
   splitright = true,
   shortmess = 'atTIF',
   undofile = true,
   tabstop = 3,
   shiftwidth = 3,
   softtabstop = 3,
   expandtab = true,
   autoindent = true,
   smartindent = true,
   cindent = true,
   colorcolumn = '80',
   completeopt = { 'menu', 'menuone', 'preview', 'noinsert', 'noselect' },
   pumheight = 7,
   showmode = false,
   swapfile = false,
}

for option, value in pairs(my_options) do
   set[option] = value
end
