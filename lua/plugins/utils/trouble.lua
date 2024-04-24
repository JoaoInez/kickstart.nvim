-- NOTE: LSP and TODOs list
return {
  'folke/trouble.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    local trouble = require 'trouble'

    vim.keymap.set('n', '<leader>lT', function()
      trouble.toggle()
    end, { desc = '[L]ist [T]rouble' })

    vim.keymap.set('n', '<leader>lw', function()
      trouble.toggle 'workspace_diagnostics'
    end, { desc = '[L]ist [W]orkspace diagnostics' })

    vim.keymap.set('n', '<leader>ld', function()
      trouble.toggle 'document_diagnostics'
    end, { desc = '[L]ist [D]ocument diagnostics' })

    vim.keymap.set('n', '<leader>lq', function()
      trouble.toggle 'quickfix'
    end, { desc = '[L]ist [Q]uickfixes' })

    vim.keymap.set('n', '<leader>ll', function()
      trouble.toggle 'loclist'
    end, { desc = '[L]ist [L]ocation lists' })

    vim.keymap.set('n', 'gR', function()
      trouble.toggle 'lsp_references'
    end, { desc = 'List LSP [R]eferences' })

    vim.keymap.set('n', '<leader>lt', '<cmd>TodoTrouble<CR>', { desc = '[L]ist [T]ODOs' })
    vim.keymap.set('n', '<leader>lT', '<cmd>TodoTrouble<CR>', { desc = '[L]ist [T]ODO/FIX/FIXME' })
  end,
}
