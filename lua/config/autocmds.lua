vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

vim.api.nvim_create_autocmd({ 'FileType' }, {
  desc = 'Disable indentscope for certain filetypes',
  callback = function()
    local ignore_filetypes = {
      'aerial',
      'alpha',
      'dashboard',
      'help',
      'lazy',
      'leetcode.nvim',
      'mason',
      'neo-tree',
      'NvimTree',
      'neogitstatus',
      'notify',
      'startify',
      'toggleterm',
      'Trouble',
      'trouble',
    }
    if vim.tbl_contains(ignore_filetypes, vim.bo.filetype) then
      vim.b.miniindentscope_disable = true
    end
  end,
})

-- WARN: Not recommended
--
-- Open Trouble Quickfix when the qf list opens
-- vim.api.nvim_create_autocmd('BufRead', {
--   callback = function(ev)
--     if vim.bo[ev.buf].buftype == 'quickfix' then
--       vim.schedule(function()
--         vim.cmd [[cclose]]
--         vim.cmd [[Trouble qflist open]]
--       end)
--     end
--   end,
-- })
