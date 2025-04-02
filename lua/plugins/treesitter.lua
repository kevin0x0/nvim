local language = {
  "c",
  "lua",
  "cpp",
  "markdown",
  "markdown_inline",
  "make",
  "python",
  "verilog",
  "haskell",
  "java",
  "javascript",
  "css",
  "html",
  "rust",
  "go",
  "bash",
}

return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    ensure_installed = language,
    -- Install parsers synchronously (only applied to `ensure_installed`)
    sync_install = false,
    auto_install = false,

    highlight = { enable = true },
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = "<M-s>",
        node_incremental = "<M-j>",
        scope_incremental = "<M-J>",
        node_decremental = "<M-k>",
      },
    },
    indent = { enable = true },
  },
  main = "nvim-treesitter.configs",
}
