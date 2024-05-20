-- NOTE: Jump around code more easily
return {
  'folke/flash.nvim',
  event = 'VeryLazy',
  keys = {
    {
      'sb',
      mode = { 'n', 'o', 'x' },
      function()
        require('flash').treesitter()
      end,
      desc = 'Select block',
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
