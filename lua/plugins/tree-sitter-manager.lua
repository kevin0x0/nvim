local ensure_installed = {
  "c",
  "lua",
  "cpp",
  "markdown",
  "markdown_inline",
  "make",
  "python",
  "systemverilog",
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
  "romus204/tree-sitter-manager.nvim",
  dependencies = {}, -- tree-sitter CLI must be installed system-wide
  -- config = function()
  --   require("tree-sitter-manager").setup()
  -- end,
  opts = {
    ensure_installed = ensure_installed,
    languages = {
      fc = {
        install_info = {
          url = "https://github.com/kevin0x0/tree-sitter-fc",
          generate = true,
          queries = "queries",
        }
      },
      klang = {
        install_info = {
          url = "https://github.com/kevin0x0/tree-sitter-klang",
          generate = true,
          queries = "queries",
        }
      },
    }
  }
}
