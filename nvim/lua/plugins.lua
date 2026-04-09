local gh = function(x)
  return 'https://github.com/' .. x
end

vim.pack.add {
  gh 'nvim-mini/mini.nvim',
  -- lsp
  gh 'neovim/nvim-lspconfig',
  gh 'mason-org/mason.nvim',
  -- formatter
  gh 'stevearc/conform.nvim',
  -- treesitter
  { src = gh 'nvim-treesitter/nvim-treesitter', version = 'main' },
  -- autocomplete
  { src = gh 'saghen/blink.cmp', version = 'v1.10.2' },
  gh 'rafamadriz/friendly-snippets',
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

require('mini.pick').setup()
vim.keymap.set('n', '<leader>ff', '<cmd>:Pick files<cr>', { desc = 'Open file picker' })

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
  'ts_ls',
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

-- Treesitter
vim.api.nvim_create_autocmd('FileType', {
  callback = function(ev)
    local lang = vim.treesitter.language.get_lang(ev.match)
    local available_langs = require('nvim-treesitter').get_available()
    local is_available = vim.tbl_contains(available_langs, lang)

    if is_available then
      local installed_langs = require('nvim-treesitter').get_installed()
      local installed = vim.tbl_contains(installed_langs, lang)

      if not installed then
        require('nvim-treesitter').install(lang):wait()
      end
      vim.treesitter.start()
      require('nvim-treesitter').indentexpr()
    end
  end,
})

-- AutoComplete
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function()
    require('blink.cmp').setup {
      keymap = { preset = 'enter' },
      appearance = { nerd_font_variant = 'mono' },
      sources = {
        default = {
          'lsp',
          'path',
          'snippets',
          'buffer',
        },
      },
      fuzzy = {
        implementation = 'prefer_rust_with_warning',
      }
    }
  end,
})
