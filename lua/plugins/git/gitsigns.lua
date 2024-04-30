-- NOTE: Adds git related signs to the gutter, as well as utilities for managing changes
-- See `:help gitsigns` to understand what the configuration keys do
return {
  {
    'lewis6991/gitsigns.nvim',
    opts = {
      current_line_blame = true,
      current_line_blame_formatter_opts = {
        relative_time = true,
      },
      on_attach = function(bufnr)
        local gitsigns = require 'gitsigns'

        local function map(mode, l, r, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, l, r, opts)
        end

        -- NOTE: Navigation
        map('n', ']c', function()
          if vim.wo.diff then
            vim.cmd.normal { ']c', bang = true }
          else
            gitsigns.nav_hunk 'next'
          end
        end, { desc = 'Jump to next git [C]hange' })

        map('n', '[c', function()
          if vim.wo.diff then
            vim.cmd.normal { '[c', bang = true }
          else
            gitsigns.nav_hunk 'prev'
          end
        end, { desc = 'Jump to previous git [C]hange' })

        -- NOTE: Actions
        -- NOTE: Visual mode
        map('v', '<leader>Gs', function()
          gitsigns.stage_hunk { vim.fn.line '.', vim.fn.line 'v' }
        end, { desc = '[G]it [S]tage hunk' })
        map('v', '<leader>Gr', function()
          gitsigns.reset_hunk { vim.fn.line '.', vim.fn.line 'v' }
        end, { desc = '[G]it [R]eset hunk' })

        -- NOTE: Normal mode
        map('n', '<leader>Gs', gitsigns.stage_hunk, { desc = '[G]it [S]tage hunk' })
        map('n', '<leader>Gr', gitsigns.reset_hunk, { desc = '[G]it [R]eset hunk' })
        map('n', '<leader>GS', gitsigns.stage_buffer, { desc = '[G]it [S]tage buffer' })
        map('n', '<leader>Gu', gitsigns.undo_stage_hunk, { desc = '[G]it [U]ndo stage hunk' })
        map('n', '<leader>GR', gitsigns.reset_buffer, { desc = '[G]it [R]eset buffer' })
        map('n', '<leader>Gp', gitsigns.preview_hunk, { desc = '[G]it [P]review hunk' })
        map('n', '<leader>Gb', gitsigns.blame_line, { desc = '[G]it [B]lame line' })
        map('n', '<leader>Gd', gitsigns.diffthis, { desc = '[G]it [D]iff against index' })
        map('n', '<leader>GD', function()
          gitsigns.diffthis '@'
        end, { desc = '[G]it [D]iff against last commit' })

        -- NOTE: Toggles
        map('n', '<leader>Gt', gitsigns.toggle_deleted, { desc = '[G]it [T]oggle git show deleted' })
      end,
    },
  },
}
