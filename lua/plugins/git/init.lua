return {
  -- NOTE: Diff views
  -- { 'sindrets/diffview.nvim', config = true },

  -- NOTE: Merge conflict highlighting
  { 'akinsho/git-conflict.nvim', opts = { disable_diagnostics = true }, config = true },

  require 'plugins.git.gitsigns',
}
