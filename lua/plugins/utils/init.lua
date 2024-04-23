return {
  -- NOTE: Detect tabstop and shiftwidth automatically
  'tpope/vim-sleuth',

  -- NOTE: Highlight todo, notes, etc in comments
  { 'folke/todo-comments.nvim', event = 'VimEnter', dependencies = { 'nvim-lua/plenary.nvim' }, opts = { signs = false } },

  -- NOTE: Persist sessions
  { 'folke/persistence.nvim', event = 'BufReadPre', opts = { options = vim.opt.sessionoptions:get() } },

  require 'plugins.utils.mini',

  require 'plugins.utils.trouble',

  require 'plugins.utils.vim-tmux-navigator',
}
