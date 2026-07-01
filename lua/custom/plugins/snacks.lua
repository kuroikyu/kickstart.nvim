return {
  'folke/snacks.nvim',
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    picker = {},
  },
  config = function(_, opts)
    require('snacks').setup(opts)

    local wk = require 'which-key'

    wk.add {
      { '<leader>sh', function() Snacks.picker.help() end, desc = '[S]earch [H]elp' },
      { '<leader>sk', function() Snacks.picker.keymaps() end, desc = '[S]earch [K]eymaps' },
      { '<leader>sf', function() Snacks.picker.files() end, desc = '[S]earch [F]iles' },
      { '<leader>ss', function() Snacks.picker.pickers() end, desc = '[S]earch [S]elect Picker' },
      { '<leader>sw', function() Snacks.picker.grep_word() end, desc = '[S]earch current [W]ord', mode = { 'n', 'v' } },
      { '<leader>sg', function() Snacks.picker.grep() end, desc = '[S]earch by [G]rep' },
      { '<leader>sd', function() Snacks.picker.diagnostics() end, desc = '[S]earch [D]iagnostics' },
      { '<leader>sr', function() Snacks.picker.resume() end, desc = '[S]earch [R]esume' },
      { '<leader>s.', function() Snacks.picker.recent() end, desc = '[S]earch Recent Files ("." for repeat)' },
      { '<leader>sc', function() Snacks.picker.commands() end, desc = '[S]earch [C]ommands' },
      { '<leader><leader>', function() Snacks.picker.buffers { sort_lastused = true } end, desc = '[ ] Find existing buffers' },
      { '<leader>sm', function() Snacks.picker.git_status() end, desc = '[S]earch Git [M]odified files (git status)' },
      { '<leader>sn', function() Snacks.picker.files { cwd = vim.fn.stdpath 'config' } end, desc = '[S]earch [N]eovim files' },
      { '<leader>s/', function() Snacks.picker.grep_buffers() end, desc = '[S]earch [/] in Open Files' },
      { '<leader>/', function() Snacks.picker.lines() end, desc = '[/] Fuzzily search in current buffer' },
    }

    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('snacks-lsp-attach', { clear = true }),
      callback = function(event)
        local buf = event.buf

        local map = function(keys, func, desc) vim.keymap.set('n', keys, func, { buffer = buf, desc = '[G]oto ' .. desc }) end

        map('grr', function() Snacks.picker.lsp_references() end, '[R]eferences')
        map('gri', function() Snacks.picker.lsp_implementations() end, '[I]mplementations')
        map('grd', function() Snacks.picker.lsp_definitions() end, '[D]efinitions')
        map('gO', function() Snacks.picker.lsp_symbols() end, 'Document Symbols')
        map('gW', function() Snacks.picker.lsp_workspace_symbols() end, 'Workspace Symbols')
        map('grt', function() Snacks.picker.lsp_type_definitions() end, '[T]ype Definition')
      end,
    })
  end,
}
