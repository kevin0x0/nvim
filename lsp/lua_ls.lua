---@diagnostic disable-next-line
local is_windows = vim.uv.os_uname().sysname == 'Windows_NT'

local function normalize_path(path)
  return is_windows and path:gsub('\\', '/') or path
end

---@type vim.lsp.Config
return {
  cmd = { 'lua-language-server' },
  filetypes = { 'lua' },
  root_markers = {
    '.luarc.json',
    '.luarc.jsonc',
    '.luacheckrc',
    '.stylua.toml',
    'stylua.toml',
    'selene.toml',
    'selene.yml',
    '.git',
  },
  settings = {
    Lua = {}
  },
  on_init = function(client)
    if not os.getenv 'LUA_LS_FOR_NVIM_PLUGIN' then
      if client.workspace_folders == nil or #client.workspace_folders == 0 then
        return
      end
      local path = normalize_path(client.workspace_folders[1].name)
      if not path:match(normalize_path(vim.fn.stdpath('config')) .. ".*") and
        not path:match(normalize_path(vim.fn.stdpath('data')) .. ".*") then
        return
      end
    end

    ---@diagnostic disable-next-line
    client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
      runtime = {
        -- Tell the language server which version of Lua you're using (most
        -- likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
        -- Tell the language server how to find Lua modules same way as Neovim
        -- (see `:h lua-module-load`)
        path = {
          'lua/?.lua',
          'lua/?/init.lua',
        },
      },
      -- Make the server aware of Neovim runtime files
      workspace = {
        checkThirdParty = false,
        library = {
          vim.env.VIMRUNTIME
          -- Depending on the usage, you might want to add additional paths
          -- here.
          -- '${3rd}/luv/library'
          -- '${3rd}/busted/library'
        }
        -- Or pull in all of 'runtimepath'.
        -- NOTE: this is a lot slower and will cause issues when working on
        -- your own configuration.
        -- See https://github.com/neovim/nvim-lspconfig/issues/3189
        -- library = {
        --   vim.api.nvim_get_runtime_file('', true),
        -- }
      }
    })
  end,
}
