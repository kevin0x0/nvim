-- oil.lua

local opt = { noremap = true, silent = true }

vim.keymap.set('n', '<a-e>', function()
  require('oil.actions').parent.callback()
end, opt);

vim.keymap.set('n', '<a-f>', function()
  require('oil.actions').open_cwd.callback()
end, opt);


return {
  "stevearc/oil.nvim",
  --- @module 'oil'
  dependencies = { "nvim-tree/nvim-web-devicons" },
  lazy = false,
  --- @type oil.SetupOpts
  opts = {
    default_file_explorer = true,
    columns = {
      "icon",
      -- "size",
      -- "permissions",
      -- "mtime",
    },
    keymaps = {
      ["g?"] = { "actions.show_help", mode = "n" },
      ["<CR>"] = "actions.select",
      ["<C-s>"] = { "actions.select", opts = { vertical = true } },
      ["<C-h>"] = { "actions.select", opts = { horizontal = true } },
      ["<C-t>"] = { "actions.select", opts = { tab = true } },
      ["<C-p>"] = "actions.preview",
      ["<C-c>"] = { "actions.close", mode = "n" },
      ["<C-l>"] = "actions.refresh",
      ["-"] = { "actions.parent", mode = "n" },
      ["_"] = { "actions.open_cwd", mode = "n" },
      ["`"] = { "actions.cd", mode = "n" },
      ["~"] = { "actions.cd", opts = { scope = "tab" }, mode = "n" },
      ["gs"] = { "actions.change_sort", mode = "n" },
      ["gx"] = "actions.open_external",
      ["g."] = { "actions.toggle_hidden", mode = "n" },
      ["g\\"] = { "actions.toggle_trash", mode = "n" },
    },
    use_default_keymaps = false,
    view_options = {
      show_hidden = true,
      case_insensitive = true,
    },
  },
}
