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
  colorscheme = os.getenv('TERM') ~= 'linux' and 'tokyonight-night' or 'evening'
end

vim.cmd.colorscheme(colorscheme)
