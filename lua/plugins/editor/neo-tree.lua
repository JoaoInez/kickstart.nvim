return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons',
    'MunifTanjim/nui.nvim',
  },
  cmd = 'Neotree',
  keys = {
    { '<leader>fe', ':Neotree reveal<cr>', desc = 'File Explorer', silent = true },
  },
  opts = {
    event_handlers = {
      {
        event = 'file_open_requested',
        handler = function()
          -- auto close
          -- vim.cmd 'Neotree close'
          -- OR
          require('neo-tree.command').execute { action = 'close' }
        end,
      },
    },
    filesystem = {
      filtered_items = {
        visible = true,
        hide_dotfiles = false,
        hide_gitignored = true,
      },
    },
    default_component_configs = {
      indent = {
        with_expanders = true,
        expander_collapsed = '',
        expander_expanded = '',
        expander_highlight = 'NeoTreeExpander',
      },
      modified = {
        symbol = ' ',
        highlight = 'NeoTreeModified',
      },
      git_status = {
        symbols = {
          added = '',
          deleted = '',
          modified = '',
          renamed = '',
          untracked = '',
          ignored = '',
          unstaged = '',
          staged = '',
          conflict = '',
        },
      },
    },
  },
}
