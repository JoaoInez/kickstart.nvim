-- NOTE: Find and replace across multiple files
return {
  'nvim-pack/nvim-spectre',
  build = false,
  cmd = 'Spectre',
  opts = { open_cmd = 'noswapfile vnew' },
  keys = {
    {
      '<leader>rf',
      function()
        require('spectre').toggle()
      end,
      desc = '[R]eplace in [F]iles',
    },
    {
      '<leader>rw',
      function()
        require('spectre').open_visual { select_word = true }
      end,
      desc = '[R]eplace [W]ord in files',
      mode = { 'n' },
    },
    {
      '<leader>rw',
      function()
        require('spectre').open_visual()
      end,
      desc = '[R]eplace [W]ord in files',
      mode = { 'v' },
    },
    {
      '<leader>rc',
      function()
        require('spectre').open_visual { select_word = true }
      end,
      desc = '[R]eplace in [C]urrent file',
      mode = { 'n' },
    },
  },
}
