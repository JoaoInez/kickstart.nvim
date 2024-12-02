-- NOTE: Jump around code more easily
return {
  'folke/flash.nvim',
  event = 'VeryLazy',
  keys = {
    {
      'sj',
      mode = { 'n', 'o', 'x' },
      function()
        require('flash').jump {
          search = { forward = true, wrap = false, multi_window = false },
        }
      end,
      desc = 'Flash forwards',
    },
    {
      'sk',
      mode = { 'n', 'o', 'x' },
      function()
        require('flash').jump {
          search = { forward = false, wrap = false, multi_window = false },
        }
      end,
      desc = 'Flash backwards',
    },
    {
      'ss',
      mode = { 'n', 'o', 'x' },
      function()
        require('flash').jump()
      end,
      desc = 'Flash jump',
    },
    {
      'sw',
      mode = { 'n', 'o', 'x' },
      function()
        require('flash').jump {
          pattern = vim.fn.expand '<cword>',
        }
      end,
      desc = 'Flash current word',
    },
    {
      'sb',
      mode = { 'n', 'o', 'x' },
      function()
        require('flash').treesitter()
      end,
      desc = 'Surround block',
    },
    {
      'sB',
      mode = { 'n', 'o', 'x' },
      function()
        require('flash').treesitter_search()
      end,
      desc = 'Surround search block',
    },
  },
  opts = {
    modes = {
      search = {
        enabled = false,
      },
      char = {
        enabled = true,
        jump_labels = true,
        -- highlight = { backdrop = false },
      },
    },
  },
}
