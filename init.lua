-- init.lua

require "common.options"
require "common.keymaps"
require "common.commands"
require "common.visual"
require "common.diagnostic"
require "common.lazy"

-- lsp
require "common.lsp"

local colorscheme = os.getenv('TERM') ~= 'linux' and 'tokyonight' or 'evening'
vim.cmd.colorscheme(colorscheme)
