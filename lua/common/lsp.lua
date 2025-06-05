
local function on_attach(bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_set_option_value('omnifunc', 'v:lua.vim.lsp.omnifunc', { buf = bufnr })
  -- Mappings.
  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'grr', function() require "telescope.builtin".lsp_references() end, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<Leader>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<Leader>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<Leader>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set('n', '<Leader>D', vim.lsp.buf.type_definition, bufopts)

  vim.keymap.set('n', '<Leader>e', vim.diagnostic.open_float, bufopts)
  vim.keymap.set('n', '<Leader>q', vim.diagnostic.setloclist, bufopts)
  vim.notify("hello", vim.log.levels.DEBUG)
end

vim.api.nvim_create_autocmd('LspAttach', {
  pattern = '*',
  callback = function(arg)
    on_attach(arg.buf)
  end
})

---@type vim.lsp.Config
local global_config = {
  capabilities = require 'cmp_nvim_lsp'.default_capabilities(),
}
vim.lsp.config('*', global_config)

vim.lsp.enable({
  'lua_ls',
  'clangd',
  'hls',
  'html',
  'jdtls',
  'pyright',
  'verible',
})
