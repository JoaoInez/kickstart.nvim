return {
  -- NOTE: Detect tabstop and shiftwidth automatically
  'tpope/vim-sleuth',

  -- NOTE:Highlight todo, notes, etc in comments
  { 'folke/todo-comments.nvim', event = 'VimEnter', dependencies = { 'nvim-lua/plenary.nvim' }, opts = { signs = false } },

  require 'plugins.utils.mini',
}
