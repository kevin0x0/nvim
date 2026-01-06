-- init.lua

require "common.options"
require "common.keymaps"
require "common.commands"
require "common.visual"
require "common.diagnostic"
require "common.lazy"

-- lsp
require "common.lsp"

local colorscheme = os.getenv("NVIM_COLORSCHEME")
if not colorscheme then
  local function has_display()
    local osname = vim.uv.os_uname().sysname;
    if osname == 'Windows' or osname == 'Darwin' then
      return true
    end
    if os.getenv("DISPLAY") then
      return true
    end
    if os.getenv("WAYLAND_DISPLAY") then
      return true
    end
    return false
  end
  colorscheme = has_display() and 'tokyonight-night' or 'elflord'
end

vim.cmd.colorscheme(colorscheme)
