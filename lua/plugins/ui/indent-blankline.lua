-- NOTE: Add indentation guides even on blank lines
return {
  'lukas-reineke/indent-blankline.nvim',
  opts = {
    indent = {
      char = '│',
      tab_char = '│',
      -- char = '',
      -- highlight = {
      --   'CursorColumn',
      --   'Whitespace',
      -- },
      -- highlight = {
      --   'RainbowRed',
      --   'RainbowYellow',
      --   'RainbowBlue',
      --   'RainbowOrange',
      --   'RainbowGreen',
      --   'RainbowViolet',
      --   'RainbowCyan',
      -- },
    },
    -- whitespace = {
    --   highlight = {
    --     'CursorColumn',
    --     'Whitespace',
    --   },
    --   remove_blankline_trail = false,
    -- },
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
