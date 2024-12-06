-- Adds git related signs to the gutter, as well as utilities for managing changes

return {
  -- NOTE: Plugins can also be added by using a table,
  -- with the first argument being the link and the following
  -- keys can be used to configure plugin behavior/loading/etc.
  --
  -- Use `opts = {}` to force a plugin to be loaded.
  --

  -- Here is a more advanced example where we pass configuration
  -- options to `gitsigns.nvim`. This is equivalent to the following Lua:
  --    require('gitsigns').setup({ ... })
  --
  -- See `:help gitsigns` to understand what the configuration keys do
  {
    'lewis6991/gitsigns.nvim',
    opts = {
      signs = {
        add = { text = '▎' },
        change = { text = '▎' },
        delete = { text = '' },
        topdelete = { text = '' },
        changedelete = { text = '▎' },
        untracked = { text = '▎' },
      },
      signs_staged = {
        add = { text = '▎' },
        change = { text = '▎' },
        delete = { text = '' },
        topdelete = { text = '' },
        changedelete = { text = '▎' },
      },
      on_attach = function(bufnr)
        local gitsigns = require 'gitsigns'
        local map = require('util').bmap(bufnr)

        -- Navigation
        map(']c', function()
          if vim.wo.diff then
            vim.cmd.normal { ']c', bang = true }
          else
            gitsigns.nav_hunk 'next'
          end
        end, { desc = 'Next Git Change' })

        map('[c', function()
          if vim.wo.diff then
            vim.cmd.normal { '[c', bang = true }
          else
            gitsigns.nav_hunk 'prev'
          end
        end, { desc = 'Previous Git Change' })

        -- Actions
        -- visual mode
        map('<leader>gs', function()
          gitsigns.stage_hunk { vim.fn.line '.', vim.fn.line 'v' }
        end, { desc = 'Stage Hunk' }, 'v')
        map('<leader>gr', function()
          gitsigns.reset_hunk { vim.fn.line '.', vim.fn.line 'v' }
        end, { desc = 'Reset Hunk' }, 'v')
        -- normal mode
        map('<leader>gs', gitsigns.stage_hunk, { desc = 'Stage Hunk' })
        map('<leader>gr', gitsigns.reset_hunk, { desc = 'Reset Hunk' })
        map('<leader>gS', gitsigns.stage_buffer, { desc = 'Stage File' })
        map('<leader>gu', gitsigns.undo_stage_hunk, { desc = 'Undo Stage Hunk' })
        map('<leader>gR', gitsigns.reset_buffer, { desc = 'Reset File' })
        map('<leader>gp', gitsigns.preview_hunk, { desc = 'Preview Hunk' })
        map('<leader>gb', gitsigns.blame_line, { desc = 'Blame Line' })
        map('<leader>gd', gitsigns.diffthis, { desc = 'Diff against index' })
        map('<leader>gD', function()
          gitsigns.diffthis '@'
        end, { desc = 'Diff against last commit' })
        -- Toggles
        map('<leader>tb', gitsigns.toggle_current_line_blame, { desc = 'Blame Line (Git)' })
        map('<leader>td', gitsigns.toggle_deleted, { desc = 'Deleted Hunks (Git)' })
      end,
    },
  },
}
