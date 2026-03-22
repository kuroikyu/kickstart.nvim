local wk = require 'which-key'

wk.add {
  -- Groups
  { '<leader>o', group = '[O]ther file', icon = ' ' },

  {
    '<leader>oo',
    '<cmd>:Other<CR>',
    desc = '[O]ther [O]pen',
  },
  {
    '<leader>ov',
    '<cmd>:OtherVSplit<CR>',
    desc = '[O]ther open in [V]ertical split',
  },
}

return {
  'rgroli/other.nvim',
  opts = {
    mappings = { 'react' },
  },
  config = function(_, opts)
    require('other-nvim').setup(opts)
  end,
}
