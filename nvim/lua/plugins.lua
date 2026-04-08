vim.pack.add {
  'https://github.com/nvim-mini/mini.nvim',
  -- lsp
  'https://github.com/neovim/nvim-lspconfig',
  'https://github.com/mason-org/mason.nvim',
  -- formatter
  'https://github.com/stevearc/conform.nvim',
}

-- Mini
vim.cmd.colorscheme 'miniautumn'
require('mini.icons').setup()
require('mini.ai').setup()
require('mini.surround').setup()
require('mini.statusline').setup()

require('mini.files').setup()
vim.keymap.set('n', '-', '<cmd>lua MiniFiles.open()<cr>', { desc = 'Toggle minifiles' })

require('mini.tabline').setup()
vim.keymap.set('n', 'H', '<cmd>bprev<cr>', { desc = 'Move to previous buffer' })
vim.keymap.set('n', 'L', '<cmd>bnex<cr>', { desc = 'Move to next buffer' })
vim.keymap.set('n', '<leader>x', require('mini.bufremove').delete, { desc = 'Delete current focus buffer' })

require("mini.pick").setup()
vim.keymap.set("n", "<leader>ff", "<cmd>:Pick files<cr>", { desc = 'Open file picker' } )

-- Lsp
require('mason').setup()

vim.lsp.config('lua_ls', {
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' },
      },
    },
  },
})

vim.lsp.enable {
  'lua_ls',
}

-- Formatter
local formatter = require 'conform'

formatter.setup {
  formatters_by_ft = {
    lua = { 'stylua' },
  },
}

vim.keymap.set('n', '<leader>fm', function()
  formatter.format { async = true, lsp_format = 'fallback' }
end)
