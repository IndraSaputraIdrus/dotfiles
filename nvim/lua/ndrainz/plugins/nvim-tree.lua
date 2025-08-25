return {
  'nvim-tree/nvim-tree.lua',
  opts = {},
  cmd = { 'NvimTreeToggle', 'NvimTreeFindFile' },
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
  keys = {
    { '<leader>e', '<cmd>NvimTreeToggle<cr>', desc = 'Toggle NvimTree' },
    { '<leader>f', '<cmd>NvimTreeFindFile<cr>', desc = 'Find File in NvimTree' },
  },
}
