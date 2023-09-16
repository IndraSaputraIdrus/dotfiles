return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      local theme = require("tokyonight")

      theme.setup({
        style = "storm",
        transparent = true
      })
      vim.cmd[[colorscheme tokyonight]]
    end
  }
}
