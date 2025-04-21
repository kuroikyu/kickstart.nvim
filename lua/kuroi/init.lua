local wk = require 'which-key'
local builtin = require 'telescope.builtin'

-- Groups
wk.add { '<leader>p', group = '[P]roject' }

-- Open project view
-- vim.keymap.set('n', '<leader>pv', vim.cmd.Ex, { desc = '[P]roject [V]iew' })
-- Oil.nvim variant
vim.keymap.set('n', '<leader>pv', '<CMD>Oil --float --preview<CR>', { desc = '[P]roject [V]iew' })

-- Center screen after half page jumps
vim.keymap.set('n', '<C-d>', '<C-d>zz', { desc = 'Jump down half a screen and center view' })
vim.keymap.set('n', '<C-u>', '<C-u>zz', { desc = 'Jump up half a screen and center view' })

-- Move current selection up or down
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", { desc = 'Visual - Move line down' })
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv", { desc = 'Visual - Move line up' })

-- Search files applying .gitignore
vim.keymap.set('n', '<leader>pf', builtin.git_files, { desc = '[P]roject Git [F]iles' })

-- Set indentation
vim.opt.tabstop = 2
