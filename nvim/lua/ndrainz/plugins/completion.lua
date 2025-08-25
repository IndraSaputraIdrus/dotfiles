return {
  'saghen/blink.cmp',
  event = { 'VimEnter' },
  version = '1.*',
  dependencies = {
    -- Snippet Engine
    {
      'L3MON4D3/LuaSnip',
      version = '2.*',
      opts = {},
    },
    'folke/lazydev.nvim',
    'rafamadriz/friendly-snippets',
  },

  --- @module 'blink.cmp'
  --- @type blink.cmp.Config
  opts = {
    keymap = { preset = 'enter' },
    completion = {
      documentation = {
        auto_show = false,
        auto_show_delay_ms = 500,
        window = {
          border = nil,
          scrollbar = false,
          winhighlight = 'Normal:BlinkCmpDoc,FloatBorder:BlinkCmpDocBorder,EndOfBuffer:BlinkCmpDoc',
        },
      },
      menu = {
        border = nil,
        scrollbar = false,
        scrolloff = 1,
        draw = {
          columns = {
            { 'kind_icon' },
            { 'label', 'label_description', gap = 1 },
            { 'kind' },
            { 'source_name' },
          },
        },
      },
    },

    appearance = {
      use_nvim_cmp_as_default = true,
      nerd_font_variant = 'mono',
    },

    sources = {
      default = {
        'lsp',
        'path',
        'snippets',
        'buffer',
      },
      providers = {
        lazydev = { module = 'lazydev.integrations.blink', score_offset = 100 },
        cmdline = {
          min_keyword_length = 2,
        },
        snippets = {
          min_keyword_length = 2,
        },
        lsp = {
          min_keyword_length = 0,
          score_offset = 0,
        },
        path = {
          min_keyword_length = 0,
        },
        buffer = {
          min_keyword_length = 4,
          max_items = 5,
        },
      },
    },

    snippets = { preset = 'luasnip' },
    fuzzy = { implementation = 'lua' },
    signature = { enable = true },
  },

  config = function(_, opts)
    vim.cmd 'highlight Pmenu guibg=none'
    vim.cmd 'highlight PmenuExtra guibg=none'
    vim.cmd 'highlight FloatBorder guibg=none'
    vim.cmd 'highlight NormalFloat guibg=none'

    require('blink.cmp').setup(opts)
    require('luasnip.loaders.from_vscode').lazy_load()
  end,
}
