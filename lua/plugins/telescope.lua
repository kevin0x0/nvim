local opt = { noremap = true, silent = true }

vim.keymap.set('n', '<Leader>fb', function()
  require "telescope.builtin".current_buffer_fuzzy_find()
end, opt)

vim.keymap.set('n', '<Leader>ff', function()
  require "telescope.builtin".find_files {
    hidden = true,
    no_ignore = true,
    no_ignore_parent = true,
  }
end, opt)

vim.keymap.set('n', '<Leader>fg', function()
  require "telescope.builtin".live_grep()
end, opt)

return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = "nvim-lua/plenary.nvim",
  opts = {},
}
