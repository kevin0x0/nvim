-- my_command.lua

vim.api.nvim_create_user_command(
  "Config",
  function(_)
    local configdir = vim.fn.stdpath('config')  --- @diagnostic disable-line
    local configfile = vim.fs.joinpath(configdir, "init.lua")
    vim.cmd.tabedit(configfile)
    vim.cmd.tcd(configdir);
  end,
  { nargs = 0 }
)
