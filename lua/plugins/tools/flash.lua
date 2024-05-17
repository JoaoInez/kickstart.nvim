-- NOTE: Jump around code more easily
return {
  'folke/flash.nvim',
  event = 'VeryLazy',
  keys = {
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
      char = {
        jump_labels = true,
      },
    },
  },
}
