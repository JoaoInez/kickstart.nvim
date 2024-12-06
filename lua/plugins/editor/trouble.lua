---@diagnostic disable: missing-parameter, missing-fields

return {
  'folke/trouble.nvim',
  cmd = { 'Trouble' },
  opts = { focus = true },
  keys = {
    { '<leader>dx', '<cmd>Trouble diagnostics toggle win.position=right win.size=0.2 filter.buf=0<cr>', desc = 'Diagnostics (Trouble)' },
    { '<leader>dS', '<cmd>Trouble symbols toggle win.position=right win.size=0.2 focus=true<cr>', desc = 'Symbols (Trouble)' },
    { '<leader>wx', '<cmd>Trouble diagnostics toggle win.position=right win.size=0.2<cr>', desc = 'Diagnostics (Trouble)' },
    { '<leader>jR', '<cmd>Trouble lsp toggle win.position=right win.size=0.2<cr>', desc = 'References/Definitions/... (Trouble)' },
    { '<leader>q', '<cmd>Trouble qflist toggle<cr>', desc = 'Quickfix List (Trouble)' },
    {
      '[q',
      function()
        if require('trouble').is_open() then
          require('trouble').prev { skip_groups = true, jump = true }
        else
          local ok, err = pcall(vim.cmd.cprev)
          if not ok then
            vim.notify(err, vim.log.levels.ERROR)
          end
        end
      end,
      desc = 'Previous Trouble/Quickfix Item',
    },
    {
      ']q',
      function()
        if require('trouble').is_open() then
          require('trouble').next { skip_groups = true, jump = true }
        else
          local ok, err = pcall(vim.cmd.cnext)
          if not ok then
            vim.notify(err, vim.log.levels.ERROR)
          end
        end
      end,
      desc = 'Next Trouble/Quickfix Item',
    },
  },
}
