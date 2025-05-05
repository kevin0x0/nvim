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

-- end global key map


-- for oil.nvim

vim.keymap.set('n', '<a-e>', function()
  require('oil.actions').parent.callback()
end, opt);

vim.keymap.set('n', '<a-f>', function()
  require('oil.actions').open_cwd.callback()
end, opt);
