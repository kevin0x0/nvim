-- keymaps.lua

local opt = { noremap = true, silent = true }
local noremap_opt = { noremap = true }

vim.g.mapleader = ' '

-- begin global key map

vim.keymap.set('i', 'jk', '<Esc>', noremap_opt)
vim.keymap.set('i', 'jK', '<Esc>', noremap_opt)
vim.keymap.set('i', 'Jk', '<Esc>', noremap_opt)
vim.keymap.set('i', 'JK', '<Esc>', noremap_opt)
-- vim.keymap.set('t', '<Esc>', [[<c-\><c-n>]], { noremap = true })

-- adjust window
vim.keymap.set('n', '<a-Up>', ':resize -1<CR>', opt)
vim.keymap.set('n', '<a-Down>', ':resize +1<CR>', opt)
vim.keymap.set('n', '<a-Left>', ':vertical resize -1<CR>', opt)
vim.keymap.set('n', '<a-Right>', ':vertical resize +1<CR>', opt)

-- switch window
vim.keymap.set('n', '<a-h>', '<C-w>h', opt)
vim.keymap.set('n', '<a-j>', '<C-w>j', opt)
vim.keymap.set('n', '<a-k>', '<C-w>k', opt)
vim.keymap.set('n', '<a-l>', '<C-w>l', opt)

-- move window
vim.keymap.set('n', '<a-S-h>', '<C-w>H', opt)
vim.keymap.set('n', '<a-S-j>', '<C-w>J', opt)
vim.keymap.set('n', '<a-S-k>', '<C-w>K', opt)
vim.keymap.set('n', '<a-S-l>', '<C-w>L', opt)

-- move cursor in insert mode
vim.keymap.set('i', '<a-H>', '<Left>', opt)
vim.keymap.set('i', '<a-J>', '<Down>', opt)
vim.keymap.set('i', '<a-K>', '<Up>', opt)
vim.keymap.set('i', '<a-L>', '<Right>', opt)

-- fast operation
vim.keymap.set('n', '<a-w>', ':w<CR>', opt)
vim.keymap.set('n', '<a-q>', ':q<CR>', opt)

-- emacs-style cmdline editing
vim.keymap.set('c', '<C-b>', '<Left>', noremap_opt)
vim.keymap.set('c', '<C-f>', '<Right>', noremap_opt)
vim.keymap.set('c', '<C-a>', '<Home>', noremap_opt)
vim.keymap.set('c', '<C-e>', '<End>', noremap_opt)
vim.keymap.set('c', '<C-n>', '<Down>', noremap_opt)
vim.keymap.set('c', '<C-p>', '<Up>', noremap_opt)
vim.keymap.set('c', '<a-b>', '<s-Left>', noremap_opt)
vim.keymap.set('c', '<a-f>', '<s-Right>', noremap_opt)
vim.keymap.set('c', '<C-d>', '<Del>', noremap_opt)
-- vim.keymap.set('c', '<a-Backspace>', '<C-w>', noremap_opt)
-- vim.keymap.set('c', '<a-d>', '<s-Right><C-w>', noremap_opt)
vim.keymap.set('c', '<C-w>', '<C-d>', noremap_opt)

-- end global key map
