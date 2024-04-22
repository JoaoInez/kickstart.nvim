return {
  -- NOTE: In visual mode use `gc` to comment selection
  { 'numToStr/Comment.nvim', opts = {} },

  -- NOTE: Preview colors
  { 'NvChad/nvim-colorizer.lua', opts = { user_default_options = { css = true, css_fn = true, tailwind = true } } },

  require 'plugins.lsp.autopairs',

  require 'plugins.lsp.cmp',

  require 'plugins.lsp.conform',

  require 'plugins.lsp.lint',

  require 'plugins.lsp.lsp-config',

  require 'plugins.lsp.treesitter',
}
