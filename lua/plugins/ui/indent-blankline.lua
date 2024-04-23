-- NOTE: Add indentation guides even on blank lines
return {
  'lukas-reineke/indent-blankline.nvim',
  opts = {
    indent = {
      char = '│',
      tab_char = '│',
      highlight = {
        'RainbowRed',
        'RainbowYellow',
        'RainbowBlue',
        'RainbowOrange',
        'RainbowGreen',
        'RainbowViolet',
        'RainbowCyan',
      },
    },
    scope = { enabled = true },
    exclude = {
      filetypes = {
        'help',
        'alpha',
        'dashboard',
        'neo-tree',
        'Trouble',
        'trouble',
        'lazy',
        'mason',
        'notify',
        'toggleterm',
        'lazyterm',
      },
    },
  },
  main = 'ibl',
}
