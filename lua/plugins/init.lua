return {
  -- NOTE: Detect tabstop and shiftwidth automatically
  'tpope/vim-sleuth',

  -- NOTE: In visual mode use `gc` to comment selection
  { 'numToStr/Comment.nvim', opts = {} },

  -- NOTE:Highlight todo, notes, etc in comments
  { 'folke/todo-comments.nvim', event = 'VimEnter', dependencies = { 'nvim-lua/plenary.nvim' }, opts = { signs = false } },

  -- NOTE: Add indentation guides even on blank lines
  -- See `:help ibl`
  { 'lukas-reineke/indent-blankline.nvim', main = 'ibl', opts = {} },
}
