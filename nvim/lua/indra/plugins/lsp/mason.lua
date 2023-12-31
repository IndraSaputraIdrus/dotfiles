return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "jayp0521/mason-null-ls.nvim",
  },
  config = function()
    local mason = require("mason")
    local servers = require("indra.list-server")

    mason.setup({})

    -- import mason-null-ls
    local mason_null_ls = require("mason-null-ls")
    mason_null_ls.setup({
      -- list of formatters & linters for mason to install
      ensure_installed = {
        "prettierd", -- ts/js formatter
        "stylua", -- lua formatter
        "eslint_d", -- ts/js linter
      },
      -- auto-install configured servers (with lspconfig)
      automatic_installation = true,
    })


    local mason_lspconfig = require("mason-lspconfig")
    mason_lspconfig.setup({
      ensure_installed = servers,
      automatic_instalation = true,
    })


  end
}
