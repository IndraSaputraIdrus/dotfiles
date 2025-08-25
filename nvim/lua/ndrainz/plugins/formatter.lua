return {
  'stevearc/conform.nvim',
  event = { 'BufReadPre' },
  cmd = { 'ConformInfo' },
  keys = {
    {
      '<leader>fm',
      function()
        require('conform').format { async = true, lsp_format = 'fallback' }
      end,
      mode = '',
      desc = '[F]ormat buffer',
    },
  },
  opts = {
    formatters = {
      prettier = {
        require_cwd = true,
      },
      biome = {
        require_cwd = true,
      },
    },
    formatters_by_ft = {
      lua = { 'stylua' },
      svelte = { 'prettierd' },
      typescript = { 'biome', 'prettierd' },
      javascript = { 'biome', 'prettierd' },
      typescriptreact = { 'prettierd' },
      javascriptreact = { 'prettierd' },
      css = { 'biome' },
      nix = { 'nixfmt' },
    },
  },
}
