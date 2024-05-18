-- NOTE: Jump around code more easily
return {
  'folke/flash.nvim',
  event = 'VeryLazy',
  keys = {
    {
      'ss',
      mode = { 'n', 'o', 'x' },
      function()
        require('flash').jump {
          search = { forward = true, wrap = false, multi_window = false },
        }
      end,
      desc = 'Flash forwards',
    },
    {
      'sb',
      mode = { 'n', 'o', 'x' },
      function()
        require('flash').jump {
          search = { forward = false, wrap = false, multi_window = false },
        }
      end,
      desc = 'Flash backwards',
    },
    {
      'sj',
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
      desc = 'Flash word',
    },
    {
      'st',
      mode = { 'n', 'o', 'x' },
      function()
        require('flash').treesitter()
      end,
      desc = 'Flash Treesitter',
    },
  },
  opts = {
    modes = {
      search = {
        enabled = true,
      },
    },
  },
}
