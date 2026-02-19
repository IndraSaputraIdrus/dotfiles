return {
  { 
    "nvim-mini/mini.files",
    dependencies = {
      {"nvim-mini/mini.icons", opts = {}}
    },
    opts = {},
    keys = {
      { "-", "<cmd>lua MiniFiles.open()<cr>", desc = "Toggle MiniFiles" }
    }
  },
  {
    "nvim-mini/mini.statusline",
    dependencies = {"nvim-mini/mini.icons", opts = {}},
    opts = {}
  },
  {
    "nvim-mini/mini.nvim",
    event = "VeryLazy",
    config = function()
      require("mini.ai").setup()
      require("mini.surround").setup()
    end
  }
}
