-- NOTE: Neo-tree is a Neovim plugin to browse the file system
-- See https://github.com/nvim-neo-tree/neo-tree.nvim
-- And also https://github.com/nvim-neo-tree/neo-tree.nvim/wiki/Recipes#handle-rename-or-move-file-event
return {
  'nvim-neo-tree/neo-tree.nvim',
  event = 'VeryLazy',
  cmd = 'Neotree',
  keys = {
    { '<leader>n', '<cmd>Neotree reveal float<CR>', desc = 'Open [N]eoTree' },
    { '<leader>Gn', '<cmd>Neotree reveal git_status float<CR>', desc = 'Open [G]it [N]eotree ' },
  },
  opts = {
    event_handlers = {
      {
        event = 'file_opened',
        handler = function()
          require('neo-tree.command').execute { action = 'close' }
        end,
      },
    },
    default_component_configs = {
      modified = {
        symbol = ' ',
        highlight = 'NeoTreeModified',
      },
      git_status = {
        symbols = {
          -- Change type
          added = '',
          deleted = '',
          modified = '',
          renamed = '',
          -- Status type
          untracked = '',
          ignored = '',
          unstaged = '',
          staged = '',
          conflict = '',
        },
      },
    },
  },
}
