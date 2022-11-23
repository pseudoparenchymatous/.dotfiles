local mapkey = vim.keymap.set

mapkey('', '<Space>', '<Nop>')
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

mapkey('i', '<C-c>', '<Esc>')

-- insert mode motions
mapkey('i', '<C-e>', '<End>')
mapkey('i', '<C-a>', '<Home>')
mapkey({ 'i', 'c' }, '<C-h>', '<Left>')
mapkey('i', '<C-j>', '<Down>')
mapkey('i', '<C-k>', '<Up>')
mapkey({ 'i', 'c' }, '<C-l>', '<Right>')

-- move between windows
mapkey('n', '<C-k>', '<C-w>k')
mapkey('n', '<C-j>', '<C-w>j')
mapkey('n', '<C-h>', '<C-w>h')
mapkey('n', '<C-l>', '<C-w>l')

-- keep visual selection after indenting
mapkey('x', '>', '>gv')
mapkey('x', '<', '<gv')

-- resize windows
mapkey('n', '<A-+>', '<C-w>+')
mapkey('n', '<A-->', '<C-w>-')
mapkey('n', '<A->>', '<C-w>>')
mapkey('n', '<A-lt>', '<C-w><')

-- move between buffers
mapkey('n', '<S-l>', '<Cmd>bn<CR>')
mapkey('n', '<S-h>', '<Cmd>bp<CR>')

-- move lines up and down
mapkey('n', '<A-j>', '<Cmd>m .+1<CR>==')
mapkey('n', '<A-k>', '<Cmd>m .-2<CR>==')
mapkey('i', '<A-j>', '<Esc>:m .+1<CR>==gi')
mapkey('i', '<A-k>', '<Esc>:m .-2<CR>==gi')
mapkey('v', '<A-j>', "<Cmd>m '>+1<CR>gv=gv")
mapkey('v', '<A-k>', "<Cmd>m '<-2<CR>gv=gv")

mapkey('n', '<Leader>e', '<Cmd>NvimTreeToggle<CR>')

vim.api.nvim_create_augroup('helpfile_user_maps', { clear = true })
vim.api.nvim_create_autocmd('FileType', {
   group = 'helpfile_user_maps',
   pattern = 'help',
   callback = function(arg)
      mapkey('n', 'q', '<C-w>c', { buffer = arg.buf })
   end,
})
