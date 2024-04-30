return {
  -- NOTE: Cursor has same color as lualine mode
  { 'mawkler/modicator.nvim', opts = {} },

  require 'plugins.ui.alpha',
  require 'plugins.ui.colorscheme',
  require 'plugins.ui.harpoon',
  require 'plugins.ui.lualine',
  require 'plugins.ui.neo-tree',
  require 'plugins.ui.noice',
  require 'plugins.ui.notify',
  require 'plugins.ui.telescope',
  require 'plugins.ui.which-key',
}
