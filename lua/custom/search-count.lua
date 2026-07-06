local ns = vim.api.nvim_create_namespace 'search-count'

-- Clears all instances of the virtual text
local function clear() vim.api.nvim_buf_clear_namespace(0, ns, 0, -1) end

local function update(recompute)
  if vim.v.hlsearch == 0 then
    clear()
    return
  end

  local ok, sc = pcall(vim.fn.searchcount, { recompute = recompute })
  if not ok or not sc or sc.total == 0 or sc.current == 0 or sc.exact_match == 0 then
    clear()
    return
  end

  local text = string.format('[%d/%d]', sc.current, sc.total)
  local cur = vim.fn.line '.' - 1

  clear()
  vim.api.nvim_buf_set_extmark(0, ns, cur, 0, {

    virt_text = { { text, 'CurSearch' } },
    virt_text_pos = 'eol',
  })
end

local augroup = vim.api.nvim_create_augroup('search-count', { clear = true })

vim.api.nvim_create_autocmd('CmdlineLeave', {
  group = augroup,
  callback = function()
    local c = vim.fn.getcmdtype()
    if c == '/' or c == '?' then vim.schedule(function() update(true) end) end
  end,
})

vim.api.nvim_create_autocmd('CursorMoved', {
  group = augroup,
  callback = function() update(true) end,
})

vim.api.nvim_create_autocmd('OptionSet', {
  group = augroup,
  pattern = 'hlsearch',
  callback = function() update(true) end,
})

vim.api.nvim_create_autocmd('SafeState', {
  group = augroup,
  callback = function()
    if vim.v.hlsearch == 0 then clear() end
  end,
})

vim.api.nvim_create_autocmd('BufEnter', {
  group = augroup,
  callback = function() update(true) end,
})
