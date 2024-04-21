local enabled = true

-- NOTE: Collection of various small independent plugins/modules
local plugin = {
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

    -- NOTE: Simple and easy statusline.
    --
    -- local statusline = require 'mini.statusline'
    --
    -- statusline.setup { use_icons = vim.g.have_nerd_font }
    --
    -- ---@diagnostic disable-next-line: duplicate-set-field
    -- statusline.section_location = function()
    --   return '%2l:%-2v'
    -- end

    require('mini.move').setup {}
  end,
}

return enabled and plugin or {}
