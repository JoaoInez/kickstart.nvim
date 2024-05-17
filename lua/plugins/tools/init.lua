return {
  -- NOTE: Detect tabstop and shiftwidth automatically
  'tpope/vim-sleuth',

  -- NOTE: Vim motions tutor
  'ThePrimeagen/vim-be-good',

  -- NOTE: Highlight todo, notes, etc in comments
  { 'folke/todo-comments.nvim', event = 'VimEnter', opts = { signs = false } },

  -- NOTE: Better quickfix menu
  { 'kevinhwang91/nvim-bqf', event = 'VeryLazy', opts = { func_map = { open = 'o', openc = '<CR>' } } },

  -- NOTE: Multi cursors
  --
  -- select words with Ctrl-N
  -- create cursors vertically with Ctrl-Down/Ctrl-Up
  -- select one character at a time with Shift-Arrows
  -- press n/N to get next/previous occurrence
  -- press [/] to select next/previous cursor
  -- press q to skip current and get next occurrence
  -- press Q to remove current cursor/selection
  -- start insert mode with i,a,I,A
  { 'mg979/vim-visual-multi', branch = 'master', event = 'VeryLazy' },

  require 'plugins.tools.mini',
  require 'plugins.tools.trouble',
  require 'plugins.tools.vim-tmux-navigator',
}
