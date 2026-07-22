return {
  "shushtain/incselect.nvim",
  init = function()
    vim.keymap.set('n', '<M-s>', function() require("incselect").init() end)
    vim.keymap.set('v', '<M-h>', function() require("incselect").prev() end)
    vim.keymap.set('v', '<M-j>', function() require("incselect").parent() end)
    vim.keymap.set('v', '<M-k>', function() require("incselect").child() end)
    vim.keymap.set('v', '<M-l>', function() require("incselect").next() end)
    vim.keymap.set('v', '<M-u>', function() require("incselect").undo() end)
  end
}
