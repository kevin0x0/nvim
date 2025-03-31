-- global visual configuration

local highlight = vim.cmd.highlight
-- make sure no trailing '~'.
vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = function(_)
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
  end
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

-- icons for diagnostics
local diagnostics_icons = {
  hint = "",
  info = "",
  warning = "",
  error = "",
}

vim.diagnostic.config {
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = diagnostics_icons.error,
      [vim.diagnostic.severity.WARN] = diagnostics_icons.warn,
      [vim.diagnostic.severity.INFO] = diagnostics_icons.info,
      [vim.diagnostic.severity.HINT] = diagnostics_icons.hint,
    }
  }
}
