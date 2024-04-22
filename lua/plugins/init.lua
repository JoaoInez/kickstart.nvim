return {
  -- NOTE: Detect tabstop and shiftwidth automatically
  'tpope/vim-sleuth',

  -- NOTE: In visual mode use `gc` to comment selection
  { 'numToStr/Comment.nvim', opts = {} },

  -- NOTE:Highlight todo, notes, etc in comments
  { 'folke/todo-comments.nvim', event = 'VimEnter', dependencies = { 'nvim-lua/plenary.nvim' }, opts = { signs = false } },

  -- NOTE: Preview colors
  { 'NvChad/nvim-colorizer.lua', opts = { user_default_options = { css = true, css_fn = true, tailwind = true } } },

  -- NOTE: Cursor has same color as lualine mode
  { 'mawkler/modicator.nvim', opts = {} },
}
