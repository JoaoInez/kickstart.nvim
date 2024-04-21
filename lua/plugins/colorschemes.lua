-- NOTE: Colorschemes
-- Use `:Telescope colorscheme` to see what colorschemes are already installed.

local tokyonight = {
  'folke/tokyonight.nvim',
  priority = 1000,
  -- init = function()
  --   vim.cmd.colorscheme 'tokyonight-night'
  --   vim.cmd.hi 'Comment gui=none'
  -- end,
  opts = {
    transparent = true,
    styles = {
      sidebars = 'transparent',
      floats = 'transparent',
    },
  },
}

local catppuccin = {
  'catppuccin/nvim',
  name = 'catppuccin',
  lazy = false,
  priority = 1000,
  init = function()
    vim.cmd.colorscheme 'catppuccin'
  end,
  opts = {
    transparent_background = true,
    integrations = {
      cmp = true,
      gitsigns = true,
      nvimtree = true,
      treesitter = true,
      notify = false,
      mini = {
        enabled = true,
        indentscope_color = '',
      },
      telescope = {
        enabled = true,
      },
    },
  },
}

return {
  -- tokyonight,
  catppuccin,
}
