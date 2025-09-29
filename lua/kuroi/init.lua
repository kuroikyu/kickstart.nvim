local wk = require 'which-key'
local builtin = require 'telescope.builtin'

wk.add {
  -- Groups
  { '<leader>p', group = '[P]roject', icon = '󰉋' },
  { '<leader>pp', group = '[P]roject [P]ersistance', icon = '󰉋' },

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

  -- Search TODOs
  {
    '<leader>st',
    '<CMD>TodoTelescope<CR>',
    desc = '[S]earch [T]ODO',
  },

  -- Persistance.nvim
  {
    '<leader>pps',
    function()
      require('persistence').load()
    end,
    desc = '[P]roject Load [S]ession for current directory',
  },

  {
    '<leader>ppS',
    function()
      require('persistence').select()
    end,
    desc = '[P]roject [S]elect Session to Load',
  },

  {
    '<leader>ppl',
    function()
      require('persistence').load { last = true }
    end,
    desc = '[P]roject [S]elect Load [L]ast Session',
  },

  {
    '<leader>ppq',
    function()
      require('persistence').stop()
    end,
    desc = "[P]roject [Q]uit Persistence. Won't save session on exit",
  },
}

-- Set indentation
vim.opt.tabstop = 2

-- NOTE: Automatically add missing imports and remove unused imports on save for TypeScript files
-- vim.api.nvim_create_autocmd('BufWritePre', {
--   group = vim.api.nvim_create_augroup('ts_fix_imports', { clear = true }),
--   desc = 'Add missing imports and remove unused imports for TS',
--   pattern = { '*.ts', '*.tsx' },
--   callback = function()
--     local params = vim.lsp.util.make_range_params()
--     params.context = { only = { 'source.addMissingImports.ts', 'source.removeUnused.ts' } }
--     local result = vim.lsp.buf_request_sync(0, 'textDocument/codeAction', params)
--     for _, res in pairs(result or {}) do
--       for _, r in pairs(res.result or {}) do
--         if r.kind == 'source.addMissingImports.ts' then
--           vim.lsp.buf.code_action { apply = true, context = { only = { 'source.addMissingImports.ts' } } }
--           vim.cmd 'write'
--         else
--           if r.kind == 'source.removeUnused.ts' then
--             vim.lsp.buf.code_action { apply = true, context = { only = { 'source.removeUnused.ts' } } }
--             vim.cmd 'write'
--           end
--         end
--       end
--     end
--   end,
-- })
