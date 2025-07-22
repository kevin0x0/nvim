-- options.lua

local vimopts = vim.opt

-- line number
vimopts.number = true
vimopts.rnu = true

vimopts.wrap = false

-- show matching parenthesis
-- vimopts.showmatch = true

-- indentation
vimopts.expandtab = true
vimopts.tabstop = 2
vimopts.softtabstop = 2

vimopts.autoindent = true
vimopts.shiftwidth = 2

-- show command
vimopts.showcmd = true

-- windows
vimopts.splitbelow = true
vimopts.splitright = true

-- search
vimopts.hlsearch = false
vimopts.ignorecase = false

-- enable true colors
-- vimopts.termguicolors = true

-- enable cursorline highlight
vimopts.cursorline = true

-- enable stack-like jumplist
vimopts.jumpoptions:append("stack")
