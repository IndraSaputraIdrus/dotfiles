return {
  'mfussenegger/nvim-lint',
  event = { 'BufReadPre', 'BufNewFile' }, -- Lazy load
  config = function()
    local linter = require 'lint'

    -- linter.linters_by_ft = {
    --   javascript = { 'eslint_d', 'biomejs' },
    --   typescript = { 'eslint_d', 'biomejs' },
    --   javascriptreact = { 'eslint_d', 'biomejs' },
    --   typescriptreact = { 'eslint_d', 'biomejs' },
    --   svelte = { 'eslint_d' },
    -- }

    linter.linters_by_ft = linter.linters_by_ft or {}

    linter.linters_by_ft['javascript'] = { 'biomejs' }
    -- linter.linters_by_ft['javascript'] = { 'eslint_d' }

    linter.linters_by_ft['typescript'] = { 'biomejs' }
    -- linter.linters_by_ft['typescript'] = { 'eslint_d' }

    linter.linters_by_ft['javascriptreact'] = { 'eslint_d', 'biomejs' }
    linter.linters_by_ft['typescriptreact'] = { 'eslint_d', 'biomejs' }

    linter.linters_by_ft['text'] = nil

    local linter_autogroup = vim.api.nvim_create_augroup('lint', { clear = true })

    vim.api.nvim_create_autocmd({ 'BufWritePost', 'InsertLeave' }, {
      group = linter_autogroup,
      callback = function()
        if vim.bo.modifiable then
          linter.try_lint()
        end
      end,
    })

    vim.keymap.set('n', '<leader>l', function()
      linter.try_lint()
    end, { desc = 'Trigger linting for current file' })
  end,
}
