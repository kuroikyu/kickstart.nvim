local wk = require 'which-key'
local builtin = require 'telescope.builtin'

wk.add {
  -- Groups
  { '<leader>p', group = '[P]roject', icon = '󰉋' },

  -- Search files applying .gitignore
  { '<leader>pf', builtin.git_files, desc = '[P]roject Git [F]iles' },

  -- Open project view
  -- { '<leader>pv', vim.cmd.Ex, desc = '[P]roject [V]iew' },
  -- Oil.nvim variant
  { '<leader>pv', '<CMD>Oil --float --preview<CR>', desc = '[P]roject [V]iew (oil.nvim)', icon = '' },

  -- Center screen after half page jumps
  { '<C-d>', '<C-d>zz', desc = 'Jump down half a screen and center view', icon = '' },
  { '<C-u>', '<C-u>zz', desc = 'Jump up half a screen and center view', icon = '' },

  -- Move visually lines selected up or down
  { mode = 'v', 'J', ":m '>+1<CR>gv=gv", desc = 'Move line down', icon = '󰶡' },
  { mode = 'v', 'K', ":m '<-2<CR>gv=gv", desc = 'Move line up', icon = '󰶣' },
}

-- Set indentation
vim.opt.tabstop = 2
