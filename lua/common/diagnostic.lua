
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
      [vim.diagnostic.severity.WARN] = diagnostics_icons.warning,
      [vim.diagnostic.severity.INFO] = diagnostics_icons.info,
      [vim.diagnostic.severity.HINT] = diagnostics_icons.hint,
    }
  },
  virtual_text = true,
  severity_sort = true,
}
