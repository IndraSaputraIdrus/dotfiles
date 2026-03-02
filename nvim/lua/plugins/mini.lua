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

      require("mini.tabline").setup()
      vim.keymap.set("n", "H","<cmd>bprev<cr>", { desc = "Move to previous buffer" })
      vim.keymap.set("n", "L","<cmd>bnex<cr>", { desc = "Move to next buffer" })
      vim.keymap.set("n", "<leader>x", require("mini.bufremove").delete, { desc = "Delete current focus buffer" })
    end
  }
}
