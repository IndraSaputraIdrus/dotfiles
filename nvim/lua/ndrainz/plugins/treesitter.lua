return {
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    main = 'nvim-treesitter.configs',
    dependencies = {
      {
        'windwp/nvim-ts-autotag',
        opts = {},
        keys = {
          { '<c-space>', desc = 'Increment Selection' },
          { '<bs>', desc = 'Decrement Selection', mode = 'x' },
        },
      },
    },
    opts = {
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false, -- Matikan highlight regex default
      },
      indent = { enable = true },
      ensure_installed = { 'javascript', 'typescript', 'html', 'svelte', 'tsx', 'css' },
      auto_install = true,
    },
  },
}
