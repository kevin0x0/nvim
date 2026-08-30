-- global visual configuration

local highlight = vim.cmd.highlight

local function general_fix(_)
  local nontext_bg = vim.fn.synIDattr(vim.fn.hlID("Normal"), "bg#", "gui");
  if nontext_bg ~= "" then
    highlight { 'EndOfBuffer', 'guifg=' .. nontext_bg, 'guibg=' .. nontext_bg }
  end
  nontext_bg = vim.fn.synIDattr(vim.fn.hlID("Normal"), "bg", "cterm");
  if nontext_bg ~= "" then
    highlight { 'EndOfBuffer', 'ctermfg=' .. nontext_bg, 'ctermbg=' .. nontext_bg }
  end

  -- fix hover markdown highlight
  highlight { 'link', 'NormalFloat', 'Pmenu', bang = true }

  -- make cursorline visible in linux terminal
  highlight { 'CursorLine',  "ctermbg=146" }
end



-- make EndOfBuffer invisible
vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = general_fix,
})

-- fix gruvbox
vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "gruvbox",
  callback = function(_)
    -- fix cursorline highlight
    highlight { 'link', 'Operator', 'GruvboxFg0', bang = true }
    -- fix variable
    highlight { 'link', 'Identifier', 'GruvboxBlue', bang = true }
    highlight { 'link', '@variable', 'Identifier', bang = true }
    highlight { 'link', '@lsp.type.variable', 'Identifier', bang = true }
    -- fix function-like macro
    highlight { 'link', '@lsp.type.macro', 'GruvboxAqua', bang = true }

  end
})

-- set colorscheme automatically depending on the termguicolors option on startup
vim.api.nvim_create_autocmd("OptionSet", {
  pattern = 'termguicolors',
  once = true,
  callback = function()
    local colorscheme = os.getenv("NVIM_COLORSCHEME")
    colorscheme = colorscheme or "tokyonight"
    if vim.o.termguicolors then
      vim.schedule(function() vim.cmd.colorscheme(colorscheme) end)
    end
  end
})
