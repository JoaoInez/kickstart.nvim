-- NOTE: Neo-tree is a Neovim plugin to browse the file system
-- See https://github.com/nvim-neo-tree/neo-tree.nvim
-- And also https://github.com/nvim-neo-tree/neo-tree.nvim/wiki/Recipes#handle-rename-or-move-file-event
return {
  'nvim-neo-tree/neo-tree.nvim',
  event = 'VeryLazy',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons',
    'MunifTanjim/nui.nvim',
  },
  cmd = 'Neotree',
  keys = {
    { '<leader>n', '<cmd>Neotree reveal<CR>', desc = 'Open [N]eoTree' },
    { '<leader>Gn', '<cmd>Neotree reveal git_status float<CR>', desc = 'Open [G]it [N]eotree ' },
  },
  opts = {
    close_if_last_window = false,
    event_handlers = {
      {
        event = 'file_opened',
        handler = function()
          require('neo-tree.command').execute { action = 'close' }
        end,
      },
    },
  },
}
