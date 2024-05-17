return {
  -- NOTE: Detect tabstop and shiftwidth automatically
  'tpope/vim-sleuth',

  -- NOTE: Vim motions tutor
  'ThePrimeagen/vim-be-good',

  -- NOTE: Highlight todo, notes, etc in comments
  { 'folke/todo-comments.nvim', event = 'VimEnter', dependencies = { 'nvim-lua/plenary.nvim' }, opts = { signs = false } },

  -- NOTE: Better quickfix menu
  { 'kevinhwang91/nvim-bqf', event = 'VeryLazy', opts = { func_map = { open = 'o', openc = '<CR>' } } },

  require 'plugins.tools.mini',
  require 'plugins.tools.trouble',
  require 'plugins.tools.vim-tmux-navigator',
}
