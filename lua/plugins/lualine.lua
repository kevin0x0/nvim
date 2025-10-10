return {
  "nvim-lualine/lualine.nvim",
  dependencies = "nvim-tree/nvim-web-devicons",
  init = function()
    vim.opt.showmode = false
  end,
  opts = {
    options = {
      icons_enabled = true,
      theme = "auto",
      section_separators = { left = "", right = "" },
      component_separators = { left = "", right = "" },
      globalstatus = true,
      always_divided_middle = false
    },
    sections = {
      lualine_c = {
        {
          'filename',
          path = 1,
        }
      }
    }
  }
}
