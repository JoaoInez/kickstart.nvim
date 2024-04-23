return {
  -- NOTE: Merge conflict highlighting
  { 'akinsho/git-conflict.nvim', opts = { disable_diagnostics = true }, config = true },

  require 'plugins.git.gitsigns',
}
