return { -- Collection of various small independent plugins/modules
  'echasnovski/mini.nvim',
  config = function()
    -- Better Around/Inside textobjects
    --
    -- Examples:
    --  - va)  - [V]isually select [A]round [)]paren
    --  - yinq - [Y]ank [I]nside [N]ext [Q]uote
    --  - ci'  - [C]hange [I]nside [']quote
    require('mini.ai').setup { n_lines = 500 }

    -- Add/delete/replace surroundings (brackets, quotes, etc.)
    --
    -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
    -- - sd'   - [S]urround [D]elete [']quotes
    -- - sr)'  - [S]urround [R]eplace [)] [']
    require('mini.surround').setup()

    -- Use CTL + ALT + <hjkl> to move text
    require('mini.move').setup {
      mappings = {
        -- Move visual selection in Visual mode. Defaults are Alt (Meta) + hjkl.
        left = '<C-M-h>',
        right = '<C-M-l>',
        down = '<C-M-j>',
        up = '<C-M-k>',

        -- Move current line in Normal mode
        line_left = '<C-M-h>',
        line_right = '<C-M-l>',
        line_down = '<C-M-j>',
        line_up = '<C-M-k>',
      },
    }

    -- TODO: Add tailwind support
    require('mini.hipatterns').setup()

    -- Add indentation guides
    require('mini.indentscope').setup {
      draw = {
        delay = 0,
        animation = require('mini.indentscope').gen_animation.none(),
      },
      -- options = { border = 'top', try_as_border = true },
      symbol = '│',
    }

    -- Toggle split arrays and objects with gS
    require('mini.splitjoin').setup()
  end,
}
