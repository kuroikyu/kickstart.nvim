local wk = require 'which-key'

-- Set custom test.tsx icon
require('nvim-web-devicons').set_icon {
  ['test.tsx'] = {
    icon = '',
    color = '#ff8700',
    cterm_color = '208',
    name = 'test.tsx',
  },
}

wk.add {
  -- Groups
  { '<leader>a', group = 'Code [A]ctions', icon = '󱚣 ' },
  -- Keybinds
  {
    '<leader>af',
    function()
      vim.lsp.buf.code_action {
        apply = true,
        context = {
          only = { 'source.fixAll.eslint' },
          diagnostics = {},
        },
      }
    end,
    desc = '[F]ixAll (eslint)',
  },
  {
    '<leader>ai',
    function()
      vim.lsp.buf.code_action {
        apply = true,
        context = {
          only = { 'source.addMissingImports.ts' },
          diagnostics = {},
        },
      }
    end,
    desc = 'Add missing [I]mports',
  },
  {
    '<leader>au',
    function()
      vim.lsp.buf.code_action {
        apply = true,
        context = {
          only = { 'source.removeUnusedImports' },
          diagnostics = {},
        },
      }
    end,
    desc = 'Remove [U]nused imports',
  },
  {
    '<leader>tz',
    '<Cmd>ZenMode<CR>',
    desc = '[T]oggle [Z]en mode',
  },
}

-- NOTE: Automatically add missing imports and remove unused imports on save for TypeScript files
-- vim.api.nvim_create_autocmd('BufWritePre', {
--   group = vim.api.nvim_create_augroup('ts_fix_imports', { clear = true }),
--   desc = 'Add missing imports and remove unused imports for TS',
--   pattern = { '*.ts', '*.tsx' },
--   callback = function()
--     -- vim.lsp.buf.code_action {
--     --   apply = true,
--     --   context = {
--     --     only = { 'source.fixAll.eslint' },
--     --     diagnostics = {},
--     --   },
--     -- }
--     -- vim.lsp.buf.code_action {
--     --   apply = true,
--     --   context = {
--     --     only = { 'source.addMissingImports.ts' },
--     --     diagnostics = {},
--     --   },
--     -- }
--     -- vim.lsp.buf.code_action {
--     --   apply = true,
--     --   context = {
--     --     only = { 'source.removeUnused.ts' },
--     --     diagnostics = {},
--     --   },
--     -- }
--     --
--     local kinds = { 'source.addMissingImports.ts', 'source.fixAll.eslint', 'source.removeUnused.ts' }
--     local params = vim.lsp.util.make_range_params(0, 'utf-8')
--     params.context = { diagnostics = {} }
--     local results = vim.lsp.buf_request_sync(0, 'textDocument/codeAction', params)
--
--     if not results then
--       return
--     end
--     for _, result in pairs(results) do
--       for _, action in pairs(result.result or {}) do
--         for _, kind in pairs(kinds) do
--           if action.kind == kind then
--             vim.notify('Action: ' .. action.kind, vim.log.levels.WARN)
--             vim.notify('Action command: ' .. action.command, vim.log.levels.WARN)
--             vim.notify('Action edit: ' .. action.edit, vim.log.levels.WARN)
--             if action.edit then
--               vim.lsp.util.apply_workspace_edit(action.edit, 'utf-16')
--             elseif action.command then
--               vim.lsp.buf.execute_command(action.command)
--             else
--               local resolve_result = vim.lsp.buf_request_sync(0, 'codeAction/resolve', action)
--               if resolve_result then
--                 for _, resolved_action in pairs(resolve_result) do
--                   vim.lsp.buf.code_action { context = { diagnostics = {}, only = resolved_action } }
--                 end
--               else
--                 vim.notify('Failed to resolve code action ' .. action.kind .. ' without edit or command', vim.log.levels.WARN)
--               end
--             end
--           end
--         end
--       end
--     end
--
--     -- local params = vim.lsp.util.make_range_params()
--     -- params.context = { only = { 'source.addMissingImports.ts', 'source.removeUnused.ts' } }
--     -- local result = vim.lsp.buf_request_sync(0, 'textDocument/codeAction', params)
--     -- for _, res in pairs(result or {}) do
--     --   for _, r in pairs(res.result or {}) do
--     --     if r.kind == 'source.addMissingImports.ts' then
--     --       vim.lsp.buf.code_action { apply = true, context = { only = { 'source.addMissingImports.ts' } } }
--     --       vim.cmd 'write'
--     --     else
--     --       if r.kind == 'source.removeUnused.ts' then
--     --         vim.lsp.buf.code_action { apply = true, context = { only = { 'source.removeUnused.ts' } } }
--     --         vim.cmd 'write'
--     --       end
--     --     end
--     --   end
--     -- end
--   end,
-- })
