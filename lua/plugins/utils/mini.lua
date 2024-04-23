-- NOTE: Collection of various small independent plugins/modules
return {
  'echasnovski/mini.nvim',
  config = function()
    -- NOTE: Better Around/Inside textobjects
    -- - va)  - [V]isually select [A]round [)]paren
    -- - yinq - [Y]ank [I]nside [N]ext [']quote
    -- - ci'  - [C]hange [I]nside [']quote
    require('mini.ai').setup { n_lines = 500 }

    -- NOTE: Add/delete/replace surroundings (brackets, quotes, etc.)
    -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
    -- - sd'   - [S]urround [D]elete [']quotes
    -- - sr)'  - [S]urround [R]eplace [)] [']
    require('mini.surround').setup()

    -- NOTE: Use ALT+<hjkl> to move text
    require('mini.move').setup()

    -- NOTE: Add indentation guides
    --
    -- require('mini.indentscope').setup {
    --   draw = {
    --     delay = 0,
    --     animation = require('mini.indentscope').gen_animation.none(),
    --   },
    --   symbol = '│',
    -- }
  end,
}
