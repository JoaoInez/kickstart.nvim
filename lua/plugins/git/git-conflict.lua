-- NOTE: Merge conflict highlighting
return {
  'akinsho/git-conflict.nvim',
  opts = {
    disable_diagnostics = true,
  },
  config = function(_, opts)
    require('git-conflict').setup(opts)

    vim.api.nvim_create_autocmd('User', {
      pattern = 'GitConflictDetected',
      callback = function()
        -- vim.notify('Conflict detected in ' .. vim.fn.expand '<afile>')
        -- vim.keymap.set('n', 'cww', function()
        --   engage.conflict_buster()
        --   create_buffer_local_mappings()
        -- end)
        require('which-key').register {
          ['<leader>Gc'] = { name = '[G]it [C]onflict', _ = 'which_key_ignore' },
        }
        vim.keymap.set('n', '<leader>Gco', '<cmd>GitConflictChooseOurs<CR>', { desc = '[G]it [C]onflict: Choose [O]urs' })
        vim.keymap.set('n', '<leader>Gct', '<cmd>GitConflictChooseTheirs<CR>', { desc = '[G]it [C]onflict: Choose [T]heirs' })
        vim.keymap.set('n', '<leader>Gcb', '<cmd>GitConflictChooseBoth<CR>', { desc = '[G]it [C]onflict: Choose [B]oth' })
        vim.keymap.set('n', '<leader>Gc0', '<cmd>GitConflictChooseNone<CR>', { desc = '[G]it [C]onflict: Choose n[0]ne' })
        vim.keymap.set('n', '<leader>Gcn', '<cmd>GitConflictNextConflict<CR>', { desc = '[G]it [C]onflict: Move to [N]ext' })
        vim.keymap.set('n', '<leader>Gcp', '<cmd>GitConflictPrevConflict<CR>', { desc = '[G]it [C]onflict: Move to [P]revious' })
        vim.keymap.set('n', '<leader>Gcl', '<cmd>GitConflictListQf<CR>', { desc = '[G]it [C]onflict: [L]ist all' })
      end,
    })
  end,
}
