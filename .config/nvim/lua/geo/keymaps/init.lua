local mapkey = vim.keymap.set

mapkey('', '<Space>', '<Nop>')
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

mapkey('i', '<C-c>', '<Esc>')

mapkey('n', '<Leader>e', '<Cmd>NvimTreeToggle<CR>')

-- system clipboard
mapkey('n', '<Leader>d', '"+d')
mapkey('n', '<Leader>y', '"+y')
mapkey('n', '<Leader>p', '"+p')
mapkey('n', '<Leader>P', '"+P')

-- insert mode motions
mapkey('i', '<C-e>', '<End>')
mapkey('i', '<C-a>', '<Home>')
mapkey({ 'i', 'c' }, '<A-h>', '<Left>')
mapkey('i', '<A-j>', '<Down>')
mapkey('i', '<A-k>', '<Up>')
mapkey({ 'i', 'c' }, '<A-l>', '<Right>')
mapkey({ 'i', 'c' }, '<A-w>', '<C-Right>')
mapkey({ 'i', 'c' }, '<A-b>', '<C-Left>')

-- improve scrolling
mapkey('n', '<C-d>', '<C-d>zz')
mapkey('n', '<C-u>', '<C-u>zz')
mapkey('n', '<C-f>', '<C-f>zz')
mapkey('n', '<C-b>', '<C-b>zz')

-- move between windows
mapkey('n', '<C-k>', '<C-w>k')
mapkey('n', '<C-j>', '<C-w>j')
mapkey('n', '<C-h>', '<C-w>h')
mapkey('n', '<C-l>', '<C-w>l')

-- keep visual selection after indenting
mapkey('x', '>', '>gv')
mapkey('x', '<', '<gv')

-- resize windows
-- mapkey('n', '<A-+>', '<C-w>+')
-- mapkey('n', '<A-->', '<C-w>-')
-- mapkey('n', '<A->>', '<C-w>>')
-- mapkey('n', '<A-lt>', '<C-w><')

-- move between buffers
mapkey('n', '<S-l>', '<Cmd>bn<CR>')
mapkey('n', '<S-h>', '<Cmd>bp<CR>')

-- move lines up and down
-- mapkey('n', '<A-j>', '<Cmd>m .+1<CR>==')
-- mapkey('n', '<A-k>', '<Cmd>m .-2<CR>==')
-- mapkey('i', '<A-j>', '<Esc>:m .+1<CR>==gi')
-- mapkey('i', '<A-k>', '<Esc>:m .-2<CR>==gi')
-- mapkey('v', '<A-j>', "<Cmd>m '>+1<CR>gv=gv")
-- mapkey('v', '<A-k>', "<Cmd>m '<-2<CR>gv=gv")

vim.api.nvim_create_augroup('helpfile_user_maps', { clear = true })
vim.api.nvim_create_autocmd('FileType', {
    group = 'helpfile_user_maps',
    pattern = 'help',
    callback = function(arg)
        mapkey('n', 'q', '<C-w>c', { buffer = arg.buf })
        mapkey('n', 'd', '<C-d>zz', { buffer = arg.buf })
        mapkey('n', 'u', '<C-u>zz', { buffer = arg.buf })
    end,
})
